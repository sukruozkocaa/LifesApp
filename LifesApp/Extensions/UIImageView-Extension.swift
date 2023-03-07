//
//  UIImageView-Extension.swift
//  LifesApp
//
//  Created by Şükrü Özkoca on 6.03.2023.
//

import Foundation
import UIKit

extension UIImageView {
    func cardImageView(imageName: String) {
        self.clipsToBounds = true
        self.layer.cornerRadius = 15
        self.contentMode = .scaleAspectFill
        self.image = UIImage(named: imageName)
    }
}
