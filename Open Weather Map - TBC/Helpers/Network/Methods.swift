//
//  Methods.swift
//  Open Weather Map - TBC
//
//  Created by Nikoloz Tatunashvili on 11/26/19.
//  Copyright © 2019 Nikoloz TatunaSvili. All rights reserved.
//

import Foundation

enum Methods {
    case weather(lat: Double, long: Double)
    case forecast(lat: Double, long: Double)
    
    private var urlPath: String {
        switch self {
        case .weather(let lat, let lon):
            return "/weather?lat=\(lat)&lon=\(lon)&appid=\(Api.appid)&units=metric"
        case .forecast(let lat, let lon):
            return "/forecast?lat=\(lat)&lon=\(lon)&appid=\(Api.appid)&units=metric"
        }
    }
    
    var url: URL? {
        return URL(string: Api.baseUrl + urlPath)
    }
}
