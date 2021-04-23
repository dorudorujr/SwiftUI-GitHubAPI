//
//  SearchRepositoryResponse.swift
//  SwiftUIGitHubAPI
//
//  Created by 杉岡 成哉 on 2021/04/23.
//

import Foundation

struct SearchRepositoryResponse: Decodable {
    let items: [Repository]
}
