//
//  ForeCastViewModel.swift
//  Open Weather Map - TBC
//
//  Created by Nikoloz Tatunashvili on 11/26/19.
//  Copyright © 2019 Nikoloz TatunaSvili. All rights reserved.
//

import Foundation

class ForeCastViewModel {
    
    private(set) var loader = Dynamic(false)
    private(set) var entity: Dynamic<WeatherEntity?> = Dynamic(nil)
    private(set) var error: Dynamic<Error?> = Dynamic(nil)
    
    func fetchData() {
        loader.value = true
        AppDelegate.delegate.appLocationManeger.notifyLocation.bindAndFire { [weak self] location in
            if let location = location {
                self?.fetchData(lat: location.latitude, long: location.longitude)
            }
        }
    }
    
    private func fetchData(lat: Double, long: Double) {
        if let url = Methods.forecast(lat: lat, long: long).url {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                self.entity.value = try decoder.decode(WeatherEntity.self, from: data)
                self.loader.value = false
                print(url)
            }catch {
                self.loader.value = false
                self.error.value = error
            }
        } else {
            loader.value = false
        }
    }
}
