//
//  UIButton-Extension.swift
//  LifesApp
//
//  Created by Şükrü Özkoca on 6.03.2023.
//

import Foundation
import UIKit
extension UIButton {
    func menuButton() {
        self.backgroundColor = .red
        self.layer.cornerRadius = 15
        self.layer.masksToBounds = false
        self.clipsToBounds = true
        self.layer.opacity = 0
        self.translatesAutoresizingMaskIntoConstraints = false

    }
}
