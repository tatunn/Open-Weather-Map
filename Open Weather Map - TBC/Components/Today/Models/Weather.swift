//
//  Weather.swift
//  Open Weather Map - TBC
//
//  Created by Nikoloz Tatunashvili on 11/26/19.
//  Copyright © 2019 Nikoloz TatunaSvili. All rights reserved.
//

import Foundation

struct WeatherEntity: Codable {
    let weather: [Weather]?
    let base: String?
    let main: Main?
    let wind: Wind?
    let clouds: Clouds?
    let dt: Int?
    let sys: Sys?
    let id: Int?
    let name: String?
    
    struct Clouds: Codable {
        let all: Int?
    }
    
    struct Weather: Codable {
        let id: Int?
        let main, weatherDescription, icon: String?
    }
    
    struct Main: Codable {
        let temp, pressure: Double?
        let humidity: Int?
        let tempMin, tempMax, seaLevel, grndLevel: Double?
    }
    
    struct Sys: Codable {
        let message: Double?
        let country: String?
        let sunrise, sunset: Int?
    }
    
    struct Wind: Codable {
        let speed: Double?
        let deg: Int?
    }
}
