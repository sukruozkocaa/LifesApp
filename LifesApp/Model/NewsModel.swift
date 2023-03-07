//
//  NewsModel.swift
//  LifesApp
//
//  Created by Şükrü Özkoca on 6.03.2023.
//

import Foundation
// MARK: - Empty
struct News: Codable {
    let success: Bool
    let result: [NewsResult]
}

// MARK: - Result
struct NewsResult: Codable {
    let key: String
    let url: String
    let description: String
    let image: String
    let name, source: String
}
