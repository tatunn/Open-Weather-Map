//
//  WeatherMainCell.swift
//  Open Weather Map - TBC
//
//  Created by Nikoloz Tatunashvili on 11/26/19.
//  Copyright © 2019 Nikoloz TatunaSvili. All rights reserved.
//

import UIKit

class WeatherMainCell: UITableViewCell, AppTableViewCell {

    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var rainLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    
    func configure(with item: AppCellDataProvider) {
        guard let model = item as? WeatherMainCellDataModel else {
            return
        }
        humidityLabel.text = model.humidity
        rainLabel.text = model.rain
        pressureLabel.text = model.pressure
        speedLabel.text = model.speed
        countryLabel.text = model.country
    }
    
}

class WeatherMainCellDataModel: AppCellDataProvider {
    let humidity: String
    let rain: String
    let pressure: String
    let speed: String
    let country: String
    
    init(humidity: String, rain: String, pressure: String, speed: String, country: String) {
        self.humidity = humidity
        self.rain = rain
        self.pressure = pressure
        self.speed = speed
        self.country = country
    }
    
    var identifier: String {
        return WeatherMainCell.className
    }
}
