//
//  SafariView.swift
//  SwiftUIGitHubAPI
//
//  Created by 杉岡 成哉 on 2021/04/23.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {      // UIViewControllerRepresentable: UIViewControllerをSwiftUIとして使う時に準拠するプロトコロル
    typealias UIViewControllerType = SFSafariViewController // SwiftUIへ変換するUIViewControllerの型を指定
    let url: URL

    // インスタンス生成時に呼ばれる
    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    // データが更新されたタイミングで呼ばれる
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {}
}
