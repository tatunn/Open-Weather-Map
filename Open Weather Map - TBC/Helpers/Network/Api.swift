//
//  Api.swift
//  Open Weather Map - TBC
//
//  Created by Nikoloz Tatunashvili on 11/26/19.
//  Copyright © 2019 Nikoloz TatunaSvili. All rights reserved.
//

import Foundation
public protocol ServerInfo: class {
    static var scheme: String { get }
    static var host: String { get }
    static var path: String { get }
    static var baseUrl: String { get }
}

extension ServerInfo {
    
    public static var baseUrl: String {
        return "\(scheme)://\(host)/\(path)"
    }
    
}

class Api: ServerInfo {
    
    static var appid: String {
        "2dd8af9d828077365d3472fdf5b5f451"
    }
    
    //lat=35&lon=139&
    
    static var scheme: String {
        "https"
    }
    
    static var host: String {
        "samples.openweathermap.org"
    }
    
    static var path: String {
        "data/2.5"
    }
    
    static func imageUrl(path: String) -> URL? {
        URL(string: "http://openweathermap.org/img/wn/" + path + ".png")
    }
}
