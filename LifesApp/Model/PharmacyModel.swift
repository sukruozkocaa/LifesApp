//
//  PharmacyModel.swift
//  LifesApp
//
//  Created by Şükrü Özkoca on 6.03.2023.
//

import Foundation

// MARK: - Empty
struct Pharmacy: Codable {
    let success: Bool
    let result: [PharmacyResult]
}

// MARK: - Result
struct PharmacyResult: Codable {
    let name, dist, address, phone: String
    let loc: String
}
