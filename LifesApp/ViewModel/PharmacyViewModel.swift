//
//  PharmacyViewModel.swift
//  LifesApp
//
//  Created by Şükrü Özkoca on 6.03.2023.
//

import Foundation

protocol sendDataProtocol2: AnyObject {
    func sendData(data: Pharmacy)
}

class PharmacyViewModel {
    weak var delegate: sendDataProtocol2?
    
    func getPharmacy() {
        NetworkManager.request(type: Pharmacy.self, url: NetworkHelper.shared.pharmacyURL, method: .get) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let pharmacy):
                print("data load")
                self.delegate?.sendData(data: pharmacy)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
