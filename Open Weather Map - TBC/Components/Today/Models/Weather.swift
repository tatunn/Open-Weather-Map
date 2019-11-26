//
//  Weather.swift
//  Open Weather Map - TBC
//
//  Created by Nikoloz Tatunashvili on 11/26/19.
//  Copyright © 2019 Nikoloz TatunaSvili. All rights reserved.
//

import Foundation

struct WeatherEntity: Codable {
    private let weather: [Weather]?
    private let base: String?
    private let main: Main?
    private let wind: Wind?
    private let clouds: Clouds?
    private let dt: Int?
    private let sys: Sys?
    private let id: Int?
    private let name: String?
    
    struct Clouds: Codable {
        let all: Int?
    }
    
    struct Weather: Codable {
        let id: Int?
        let main, description, icon: String?
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
    
    var temp: Double {
        let kelvin = main?.temp ?? 0
        return kelvin
    }
}

extension WeatherEntity {
    var prettyName: String {
        return name ?? ""
    }
    
    var prettyDescr: String {
        return "\(temp)°C | \(weather?.first?.description ?? "")"
    }
    
    var prettyIcon: String {
        return weather?.first?.icon ?? "01d"
    }
    
    var prettyHumidity: String {
        "\(main?.humidity ?? 0)%"
    }
    
    var prettyRain: String {
        "\(clouds?.all ?? 0)%"
    }
    
    var prettyPressure: String {
        "\(main?.pressure ?? 0) hPa"
    }
    
    var prettySpeed: String {
        "\(wind?.speed ?? 0) km/h"
    }
    
    var prettyCountry: String {
        "\(sys?.country ?? "GE")"
    }
}
