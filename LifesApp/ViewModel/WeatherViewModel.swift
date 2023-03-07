//
//  WeatherViewModel.swift
//  LifesApp
//
//  Created by Şükrü Özkoca on 6.03.2023.
//

import Foundation

protocol sendDataProtocol4: AnyObject {
    func sendData(data: Weather)
}

class WeatherViewModel {
    weak var delegate: sendDataProtocol4?
    
    func getPharmacy(city: String) {
        NetworkManager.request(type: Weather.self, url: NetworkHelper.shared.weatherURL+"\(city)", method: .get) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let weather):
                print("data load")
                self.delegate?.sendData(data: weather)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
