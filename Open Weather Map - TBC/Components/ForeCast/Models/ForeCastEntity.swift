//
//  ForeCastEntity.swift
//  Open Weather Map - TBC
//
//  Created by Nikoloz Tatunashvili on 11/30/19.
//  Copyright © 2019 Nikoloz TatunaSvili. All rights reserved.
//

import Foundation

struct ForeCastEntity: Codable {
    private let list: [ListItem?]?
    let city: City?
    
    var prettyList: [ListItem] {
        return list?.compactMap({ $0 }) ?? []
    }
    
    struct ListItem: Codable {
        private let dt: Double?
        private let weather: [WeatherEntity.Weather]?
        private let main: WeatherEntity.Main?
        
        var prettyIcon: String {
            return weather?.first?.icon ?? "01d"
        }
        
        var prettyDate: Date {
            Date(timeIntervalSince1970: dt ?? 0)
        }
        
        var prettyDesc: String {
            weather?.first?.description ?? ""
        }
        
        var prettyTemp: String {
            "\(main?.temp ?? 0)°"
        }
    }
    
    struct City: Codable {
        let name: String?
        let country: String?
    }
}

extension ForeCastEntity {

}
