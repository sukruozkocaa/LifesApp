//
//  WeatherModel.swift
//  LifesApp
//
//  Created by Şükrü Özkoca on 6.03.2023.
//

import Foundation

struct Weather: Codable {
    let result: [WeatherResult]
}

// MARK: - Result
struct WeatherResult: Codable {
    let date, day: String
    let icon: String
    let description, status, degree, min: String
    let max, night, humidity: String
}
