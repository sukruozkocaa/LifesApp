//
//  PrayerViewModel.swift
//  LifesApp
//
//  Created by Şükrü Özkoca on 6.03.2023.
//

import Foundation

protocol sendDataProtocol3: AnyObject {
    func sendData(data: Prayer)
}

class PrayerViewModel {
    weak var delegate: sendDataProtocol3?
    
    func getPrayer() {
        NetworkManager.request(type: Prayer.self, url: NetworkHelper.shared.prayerURL, method: .get) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let prayer):
                print("data load")
                self.delegate?.sendData(data: prayer)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
