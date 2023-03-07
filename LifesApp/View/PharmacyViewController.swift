//
//  PharmacyViewController.swift
//  LifesApp
//
//  Created by Şükrü Özkoca on 6.03.2023.
//

import UIKit
import CardSlider

struct Item: CardSliderItem {
    var image: UIImage
    var title: String
    var subtitle: String?
    var description: String?
    var rating: Int?
}

class PharmacyViewController: UIViewController, CardSliderDataSource{
    func item(for index: Int) -> CardSliderItem {
        return data[index]
    }
    
    func numberOfItems() -> Int {
        return data.count
    }
    
 
    
    private let bgImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "background2")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let contentView: UIView = {
       let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var data = [Item]()
    
    private let viewModel = PharmacyViewModel()
    var pharmacy: Pharmacy?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(bgImageView)
        viewModel.delegate = self
        viewModel.getPharmacy()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        bgImageView.frame = view.bounds
    }
    

}

extension PharmacyViewController: sendDataProtocol2 {
    func sendData(data: Pharmacy) {
        for i in 0...data.result.count-1 {
            self.data.append(Item(image: UIImage(named: "eczanelogo")!, title:"\(data.result[i].name) ECZANESİ",subtitle: "+90 \(data.result[i].phone)",description: "\(data.result[i].address)",rating: 4))
        }
        
         let vc = CardSliderViewController.with(dataSource: self)
         vc.modalPresentationStyle = .fullScreen
         //vc.delegate = self
         present(vc, animated: true)
    }
}

