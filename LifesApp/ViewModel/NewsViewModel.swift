//
//  NewsViewModel.swift
//  LifesApp
//
//  Created by Şükrü Özkoca on 6.03.2023.
//

import Foundation

protocol sendDataProtocol5: AnyObject {
    func sendData(data: News)
}

class NewsViewModel {
    weak var delegate: sendDataProtocol5?
    
    func getPharmacy() {
        NetworkManager.request(type: News.self, url: NetworkHelper.shared.newsURL, method: .get) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let news):
                print("data load")
                self.delegate?.sendData(data: news)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
