//
//  CityViewModel.swift
//  LifesApp
//
//  Created by Şükrü Özkoca on 7.03.2023.
//

import Foundation

class CityViewModel{
    
    var cities: [City] = City.data
    var cityArray = [String]()

    func getCities() -> [String] {
        
        for i in 0...cities.count-1 {
            cityArray.append(cities[i].cityName)
        }
        
        return cityArray
    }
}
