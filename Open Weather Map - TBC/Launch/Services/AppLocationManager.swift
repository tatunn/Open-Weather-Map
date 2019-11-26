//
//  AppLocationManager.swift
//  Open Weather Map - TBC
//
//  Created by Nikoloz Tatunashvili on 11/26/19.
//  Copyright © 2019 Nikoloz TatunaSvili. All rights reserved.
//

import UIKit
import CoreLocation

class AppLocationManager: NSObject, UIApplicationDelegate {
    
    let manager = CLLocationManager()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        return true
    }
    
    var lastKnownLocation: CLLocationCoordinate2D? {
        set{
            notifyLocation.value = newValue
        }
        get{
            self.permision()
            return notifyLocation.value
        }
        
    }
    
    private let manager: CLLocationManager = CLLocationManager()
    
    private override init() {
        super.init()
        manager.delegate = self
        manager.distanceFilter = kCLDistanceFilterNone
        manager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
    }
    
    func startLocationUpdate() {
        if CLLocationManager.locationServicesEnabled() {
            manager.startUpdatingLocation()
            manager.startMonitoringSignificantLocationChanges()
        }
    }
    
    func startAlwaysTrack() {
        if CLLocationManager.locationServicesEnabled() {
            manager.startMonitoringSignificantLocationChanges()
        }
        if #available(iOS 11.0, *) {
            manager.showsBackgroundLocationIndicator = true
        }
        manager.allowsBackgroundLocationUpdates = true
        manager.pausesLocationUpdatesAutomatically = false
    }
    
    func stopAlwaysTrack() {
        if CLLocationManager.locationServicesEnabled() {
            manager.stopMonitoringSignificantLocationChanges()
        }
        manager.allowsBackgroundLocationUpdates = false
        manager.pausesLocationUpdatesAutomatically = true
    }
    
    func stopLocationUpdate() {
        if CLLocationManager.locationServicesEnabled() {
            manager.stopUpdatingLocation()
        }
    }
    
    func permision() {
        switch CLLocationManager.authorizationStatus() {
        case .restricted, .notDetermined:
            manager.requestAlwaysAuthorization()
        case .denied:
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3.0) {
                self.popUp()
            }
            break
        case .authorizedAlways, .authorizedWhenInUse:
            //using
            break
        @unknown default:
            break
        }
    }
}
