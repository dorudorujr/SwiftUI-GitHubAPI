//
//  Owner.swift
//  SwiftUIGitHubAPI
//
//  Created by 杉岡 成哉 on 2021/04/23.
//

import Foundation

struct Owner: Decodable, Hashable, Identifiable {
    let id: Int
    let avatarUrl: String
}
