//
//  TodayViewModel.swift
//  Open Weather Map - TBC
//
//  Created by Nikoloz Tatunashvili on 11/26/19.
//  Copyright © 2019 Nikoloz TatunaSvili. All rights reserved.
//

import Foundation

class TodayViewModel {
    
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
        if let url = Methods.weather(lat: lat, long: long).url {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                self.entity.value = try decoder.decode(WeatherEntity.self, from: data)
                self.loader.value = false
                firebaseSaveData(lat: lat, lon: long)
                print(url)
            }catch {
                self.loader.value = false
                self.error.value = error
            }
        } else {
            loader.value = false
        }
    }
    
    func getShareCctivityItems() -> [Any] {
        if let loc = AppDelegate.delegate.appLocationManeger.lastKnownLocation,
            let url = Methods.weather(lat: loc.latitude, long: loc.longitude).url {
            return [url]
        }
        
        return [entity.value?.prettyDescr ?? ""]
    }
    
    private func firebaseSaveData(lat: Double, lon: Double) {
        guard let temp = entity.value?.temp else { return }
        FireBaseDB.shared.save(location: lat, lon: lon, temp: temp)
    }
    
}
