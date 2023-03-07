//
//  WeatherViewCell.swift
//  LifesApp
//
//  Created by Şükrü Özkoca on 6.03.2023.
//

import UIKit

protocol selectLocationProtocol {
    func selectLocation()
}

class WeatherViewCell: UICollectionViewCell {

    @IBOutlet weak var cityView: UILabel!
    @IBOutlet weak var selectLocationButton: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var degreeView: UIView!
    @IBOutlet weak var degreeLabel: UILabel!
    @IBOutlet weak var descriptionImageView: UIImageView!
    
    @IBOutlet weak var minDegreeView: UIView!
    @IBOutlet weak var nightDegreeView: UIView!
    @IBOutlet weak var maxDegreeView: UIView!
    
    @IBOutlet weak var minImageView: UIImageView!
    @IBOutlet weak var nightImageView: UIImageView!
    @IBOutlet weak var maxImageView: UIImageView!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var nightLabel: UILabel!
    @IBOutlet weak var maxLabel: UILabel!
    var degreeX: NSString?
    var delegate: selectLocationProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cityLabel.layer.opacity = 0.7
        selectLocationButton.layer.cornerRadius = 10
        selectLocationButton.setImage(UIImage(systemName: "location.fill",withConfiguration: UIImage.SymbolConfiguration(pointSize: 15)), for: .normal)
        nightDegreeView.layer.cornerRadius = 25
        nightDegreeView.layer.opacity = 0.8
        nightImageView.image = UIImage(systemName: "moon.fill")
        nightImageView.tintColor = .white
        
        minDegreeView.layer.cornerRadius = 25
        minDegreeView.layer.opacity = 0.8
        minImageView.image = UIImage(systemName: "thermometer.low")
        minImageView.tintColor = .white
        
        maxDegreeView.layer.cornerRadius = 25
        maxDegreeView.layer.opacity = 0.8
        maxImageView.image = UIImage(systemName: "thermometer.high")
        maxImageView.tintColor = .white
        
        degreeView.layer.opacity = 0.7
        // Initialization code
    }

    func configure(city: String, date: String, day: String, icon: String, description: String, degree: String, min: String, max: String, night: String, humidity: String ) {
        
        if let url = URL(string: icon) {
            downloadImage(from: url)
        }
        descriptionLabel.text = description.uppercased()
        var doubleValue : Double = Double(degree) ?? 0.0
        degreeLabel.text = String(format: "%.-1f", doubleValue) + "°"
        cityLabel.text = city
        doubleValue = Double(night) ?? 0.0
        nightLabel.text = String(format: "%.-1f", doubleValue) + "°"
        doubleValue = Double(min) ?? 0.0
        minLabel.text = String(format: "%.-1f", doubleValue) + "°"
        doubleValue = Double(max) ?? 0.0
        maxLabel.text = String(format: "%.-1f", doubleValue) + "°"
        dateLabel.text = "\(day) - \(date)"
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(from url: URL) {
        print("Download Started")
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            // always update the UI from the main thread
            DispatchQueue.main.async() { [weak self] in
                self?.descriptionImageView.image = UIImage(data: data)
            }
        }
    }
    @IBAction func locationClick(_ sender: Any) {
        delegate?.selectLocation()
    }
}
