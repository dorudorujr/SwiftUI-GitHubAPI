//
//  SearchRepositoryRequest.swift
//  SwiftUIGitHubAPI
//
//  Created by 杉岡 成哉 on 2021/04/23.
//

import Foundation

protocol APIRequestType {
    associatedtype Response: Decodable

    var path: String { get }
    var queryItems: [URLQueryItem]? { get }
}

struct SearchRepositoryRequest: APIRequestType {
    typealias Response = SearchRepositoryResponse   // model

    var path: String { return "/search/repositories" }
    var queryItems: [URLQueryItem]? {
        return [
            .init(name: "q", value: query),
            .init(name: "order", value: "desc")
        ]
    }

    private let query: String

    init(query: String) {
        self.query = query
    }
}
