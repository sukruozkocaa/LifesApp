//
//  WeatherViewController.swift
//  LifesApp
//
//  Created by Şükrü Özkoca on 6.03.2023.
//

import UIKit
import DownPickerSwift

class WeatherViewController: UIViewController {

    private let bgImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "manzara")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewLayout()
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect(), collectionViewLayout: layout)
        flowLayout.scrollDirection = .horizontal
        collectionView.isPagingEnabled = true
        collectionView.collectionViewLayout = flowLayout
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(UINib(nibName: "WeatherViewCell", bundle: nil), forCellWithReuseIdentifier: "WeatherViewCell")
        return collectionView
    }()
    
    private let countryTextField: UITextField = {
       let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 8
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
        
    private let viewModel = WeatherViewModel()
    private let cityViewModel = CityViewModel()
    var data: Weather?
    var personDownPicker: DownPicker!
    var selectCity: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let attributes = [
            NSAttributedString.Key.foregroundColor: UIColor.systemGray4,
            NSAttributedString.Key.font : UIFont(name: "GillSans-Bold", size: 17) // Note the !
        ]
        
        view.addSubview(bgImageView)
        view.addSubview(countryTextField)
        countryTextField.snp.makeConstraints {(make) in
            make.width.equalTo(view.frame.width*0.7)
            make.height.equalTo(50)
            make.centerY.equalTo(view)
            make.centerX.equalTo(view)
        }
        countryTextField.setLeftPaddingPoints(20)
        bgImageView.layer.opacity = 0.5
        
        personDownPicker = DownPicker(with: self.countryTextField, data: cityViewModel.getCities())
        personDownPicker.setAttributedPlaceholder(newTitle: NSAttributedString(string: "Select Country",attributes: attributes as [NSAttributedString.Key : Any]))
        personDownPicker.addTarget(self, action: #selector(selectCountry(selectedValue:)), for: .allEvents)
        // Do any additional setup after loading the view.
    }
    
    @objc func selectCountry(selectedValue: DownPicker) {
        if !countryTextField.isHidden {
            UIView.animate(withDuration: 0.5, delay: 0.0) {
                self.bgImageView.layer.opacity = 1
                self.countryTextField.isHidden = true
            }
        }
        else {
            collectionView.isHidden = false
            selectCity = selectedValue.text
            viewModel.delegate = self
            viewModel.getPharmacy(city: selectedValue.text)
            view.addSubview(collectionView)
            collectionView.snp.makeConstraints {(make) in
                make.top.equalTo(50)
                make.width.equalTo(view.frame.width)
                make.height.equalTo(view.frame.height-50)
            }
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        bgImageView.frame = view.bounds
    }
}

extension WeatherViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data?.result.count ?? 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: WeatherViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherViewCell", for: indexPath) as! WeatherViewCell
        cell.delegate = self
        let data = data?.result[indexPath.row]
        cell.configure(city: selectCity ?? "", date: data?.date ?? "", day: data?.day ?? "", icon: data?.icon ?? "", description: data?.description ?? "", degree: data?.degree ?? "", min: data?.min ?? "", max: data?.max ?? "", night: data?.night ?? "", humidity: data?.humidity ?? "")
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height*0.9)
    }
    public func collectionView(_ collectionView: UICollectionView, layout
    collectionViewLayout: UICollectionViewLayout,
    minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension WeatherViewController: sendDataProtocol4 {
    func sendData(data: Weather) {
        DispatchQueue.main.async {
            self.data = data
            self.collectionView.reloadData()
        }
    }
}

extension WeatherViewController: selectLocationProtocol {
    func selectLocation() {
        self.collectionView.isHidden = true
        self.countryTextField.isHidden = false
    }
}
