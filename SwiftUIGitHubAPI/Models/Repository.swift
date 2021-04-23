//
//  Repository.swift
//  SwiftUIGitHubAPI
//
//  Created by 杉岡 成哉 on 2021/04/23.
//

import Foundation

struct Repository: Decodable, Hashable, Identifiable {
    let id: Int
    let name: String
    let description: String?
    let stargazersCount: Int
    let language: String?
    let htmlUrl: String
    let owner: Owner
}
