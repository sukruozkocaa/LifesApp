//
//  NetworkHelper.swift
//  LifesApp
//
//  Created by Şükrü Özkoca on 6.03.2023.
//

import Foundation

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum ErrorTypes: String, Error {
    case invalidData = "Invalid Data"
    case invalidURL = "Invalid URL"
    case unknownError = "An error unknown"
}


class NetworkHelper {
    
    static let shared = NetworkHelper()
    static let countryName = String().firstUppercased
    
    let fuelURL = "https://api.collectapi.com/gasPrice/fromCoordinates?lng=28.979530&lat=41.015137"
    let pharmacyURL = "https://api.collectapi.com/health/dutyPharmacy?il=Eskisehir"
    let weatherURL = "https://api.collectapi.com/weather/getWeather?data.lang=tr&data.city="
    let prayerURL = "https://api.collectapi.com/pray/all?data.city=istanbul"
    let newsURL = "https://api.collectapi.com/news/getNews?country=tr&tag=general"
}
