//
//  APIService.swift
//  SwiftUIGitHubAPI
//
//  Created by 杉岡 成哉 on 2021/04/23.
//

import Foundation
import Combine

protocol APIServiceType {
    func request<Request>(with request: Request) -> AnyPublisher<Request.Response, APIServiceError> where Request: APIRequestType
}

final class APIService: APIServiceType {

    private let baseURLString: String
    init(baseURLString: String = "https://api.github.com") {
        self.baseURLString = baseURLString
    }

   func request<Request>(with request: Request) -> AnyPublisher<Request.Response, APIServiceError> where Request: APIRequestType {

    guard let pathURL = URL(string: request.path, relativeTo: URL(string: baseURLString)) else {
        return Fail(error: APIServiceError.invalidURL).eraseToAnyPublisher()
    }

    var urlComponents = URLComponents(url: pathURL, resolvingAgainstBaseURL: true)!
    urlComponents.queryItems = request.queryItems
    var request = URLRequest(url: urlComponents.url!)
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")

    let decorder = JSONDecoder()
    decorder.keyDecodingStrategy = .convertFromSnakeCase
    return URLSession.shared.dataTaskPublisher(for: request)        // Publisher
        .map { data, urlResponse in data }                             // dataのみを流すようにしている
        .mapError { _ in APIServiceError.responseError }            // エラーだったらエラーを流す
        .decode(type: Request.Response.self, decoder: decorder)
        .mapError({ (error) -> APIServiceError in
            APIServiceError.parseError(error)
        })
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()                                        // 型のネストを削除
    }
}
