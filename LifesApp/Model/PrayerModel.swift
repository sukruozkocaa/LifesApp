//
//  PrayerModel.swift
//  LifesApp
//
//  Created by Şükrü Özkoca on 6.03.2023.
//

import Foundation

// MARK: - Empty
struct Prayer: Codable {
    let success: Bool
    let result: [PrayerResult]
}

// MARK: - Result
struct PrayerResult: Codable {
    let saat, vakit: String
}
