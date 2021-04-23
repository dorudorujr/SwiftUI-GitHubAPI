//
//  APIServiceError.swift
//  SwiftUIGitHubAPI
//
//  Created by 杉岡 成哉 on 2021/04/23.
//

import Foundation

enum APIServiceError: Error {
    case invalidURL               // URL不正
    case responseError           // レスポンスにエラーが発生
    case parseError(Error)      // JSONのパースエラー
}
