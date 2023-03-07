//
//  ViewController.swift
//  LifesApp
//
//  Created by Şükrü Özkoca on 5.03.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController, CircleMenuDelegate {
    
    private let circleMenuView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = false
        view.clipsToBounds = true
        return view
    }()
     
    private let menuView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 40
        return view
    }()
    
    let items: [(icon: String, color: UIColor)] = [
        ("newspaper", UIColor(red: 0.19, green: 0.57, blue: 1, alpha: 1)),
        ("cloud.moon.rain", UIColor(red: 0.22, green: 0.74, blue: 0, alpha: 1)),
        ("cross.case", UIColor(red: 0.96, green: 0.23, blue: 0.21, alpha: 1)),
        ("moon", UIColor(red: 0.51, green: 0.15, blue: 1, alpha: 1))
    ]
    
    let button = CircleMenu(frame: CGRect(), normalIcon: "icon_search", selectedIcon: "icon_close")
    let screenSize = UIScreen.main.bounds
    let fuelView = UIImageView()
    let prayerView = UIImageView()
    let weatherView = UIImageView()
    let pharmacyView = UIImageView()
    let backgroundImageView = UIImageView()
    var guide = UILayoutGuide()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImageView.image = UIImage(named: "background2")
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.frame = view.bounds

        view.addSubview(backgroundImageView)
        
        fuelView.frame = CGRect(x: -view.frame.width*0.45, y: 30, width: 0, height: view.frame.height*0.5)
        fuelView.cardImageView(imageName: "istasyon")
        view.addSubview(fuelView)
        
        pharmacyView.frame = CGRect(x: view.frame.width*1.5, y: 30, width: 0, height: view.frame.height*0.5)
        pharmacyView.cardImageView(imageName: "eczane")
        view.addSubview(pharmacyView) // prayer
        
        weatherView.frame = CGRect(x: -view.frame.width*0.45, y: view.frame.height*0.50, width: 0, height: view.frame.height*0.5)
        weatherView.cardImageView(imageName: "weather")
        view.addSubview(weatherView)
      
        prayerView.frame = CGRect(x: view.frame.width*1.5, y: view.frame.height*0.50, width: 0, height: view.frame.height*0.5)
        prayerView.cardImageView(imageName: "camii")
        view.addSubview(prayerView)
        button.menuButton()
        button.delegate = self
        button.delegateButton = self
        view.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.width.equalTo(70)
            make.height.equalTo(70)
            make.centerX.equalTo(view)
            make.top.equalTo(view).offset(view.frame.height/2-10)
        }
        loadAnimateViews()
    }

    func loadAnimateViews() {
        UIView.animate(withDuration: 0.5, delay: 0.0, animations: {
            self.fuelView.frame = CGRect(x: 5, y: 30, width: self.view.frame.width/2-5, height: self.view.frame.height*0.5)

        },completion: { finish in
            UIView.animate(withDuration: 0.5, delay: 0.0, animations: {
                self.fuelView.transform = CGAffineTransform(scaleX: 0.90, y: 0.90)
                self.fuelView.layer.cornerRadius = 15
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {}
                self.pharmacyView.frame = CGRect(x: self.view.frame.width*0.50, y: 30, width: self.view.frame.width/2-5, height: self.view.frame.height*0.5)
            },completion: {finish in
                UIView.animate(withDuration: 0.5, delay: 0.0, animations: {
                    self.pharmacyView.transform = CGAffineTransform(scaleX: 0.90, y: 0.90)
                    self.pharmacyView.layer.cornerRadius = 15
                    UIView.animate(withDuration: 0.5, delay: 0.0, animations: {
                        self.weatherView.frame = CGRect(x:5, y: self.view.frame.height*0.50, width: self.view.frame.width/2-5, height: self.view.frame.height*0.5)
                    },completion: {finish in
                        UIView.animate(withDuration: 0.5, delay: 0.0, animations: {
                            self.weatherView.transform = CGAffineTransform(scaleX: 0.90, y: 0.90)
                            self.weatherView.layer.cornerRadius = 15
                            UIView.animate(withDuration: 0.5, delay: 0.0, animations: {
                                self.prayerView.frame = CGRect(x: self.view.frame.width*0.50, y: self.view.frame.height*0.50, width: self.view.frame.width/2-5, height: self.view.frame.height*0.5)
                            },completion: {finish in
                                UIView.animate(withDuration: 0.5, delay: 0.0, animations: {
                                    self.prayerView.transform = CGAffineTransform(scaleX: 0.90, y: 0.90)
                                    self.prayerView.layer.cornerRadius = 15
                                    self.button.layer.opacity = 1
                                })
                            })
                        })
                    })
                })
                
            })
        })
    }

    func circleMenu(_: CircleMenu, willDisplay button: UIButton, atIndex: Int) {
        button.backgroundColor = items[atIndex].color
        button.setImage(UIImage(systemName: items[atIndex].icon,withConfiguration: UIImage.SymbolConfiguration(pointSize: 35)), for: .normal)
        
        let highlightedImage = UIImage(named: items[atIndex].icon)?.withRenderingMode(.alwaysTemplate)
        button.setImage(highlightedImage, for: .highlighted)
        button.tintColor = .black
    }

    func circleMenu(_: CircleMenu, buttonWillSelected _: UIButton, atIndex: Int) {
        print("button will selected: \(atIndex)")
    }

    func circleMenu(_: CircleMenu, buttonDidSelected _: UIButton, atIndex: Int) {
        print("button did selected: \(atIndex)")
        if atIndex == 0 {
            let vc = NewsViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else if atIndex == 1 {
            let vc = WeatherViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else if atIndex == 2 {
            let vc = PharmacyViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else {
            let vc = PrayerViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension ViewController: buttonTouchDelegate {
    func cancelButton() {
        UIView.animate(withDuration: 0.5, delay: 0.0, animations: {
            self.fuelView.layer.opacity = 1
            self.prayerView.layer.opacity = 1
            self.weatherView.layer.opacity = 1
            self.pharmacyView.layer.opacity = 1
        })
    }
    
    func touchButton() {
        UIView.animate(withDuration: 0.5, delay: 0.0, animations: {
            self.fuelView.layer.opacity = 0.5
            self.prayerView.layer.opacity = 0.5
            self.weatherView.layer.opacity = 0.5
            self.pharmacyView.layer.opacity = 0.5
        })
      
    }
}

