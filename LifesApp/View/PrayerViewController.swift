//
//  PrayerViewController.swift
//  LifesApp
//
//  Created by Şükrü Özkoca on 6.03.2023.
//

import UIKit

class PrayerViewController: UIViewController {

    private let bgImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "background2")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    private let viewModel = PrayerViewModel()
    var data: Prayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(bgImageView)
        viewModel.delegate = self
        viewModel.getPrayer()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        bgImageView.frame = view.bounds
    }
}

extension PrayerViewController: sendDataProtocol3 {
    func sendData(data: Prayer) {
        self.data = data
    }
}
