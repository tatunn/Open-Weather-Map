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
        
    @discardableResult
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        permision()
        
        return true
    }
    
    let notifyLocation: Dynamic<CLLocationCoordinate2D?> = Dynamic(nil)
    
    var lastKnownLocation: CLLocationCoordinate2D? {
        set {
            if notifyLocation.value != newValue {
                notifyLocation.value = newValue
            }
        }
        get{
            notifyLocation.value
        }
    }
    
    private let manager = CLLocationManager()
    
    override init() {
        super.init()
        manager.delegate = self
        manager.distanceFilter = 100
        manager.desiredAccuracy = kCLLocationAccuracyHundredMeters
    }
    
    func startLocationUpdate() {
        if CLLocationManager.locationServicesEnabled() {
            manager.startUpdatingLocation()
            manager.startMonitoringSignificantLocationChanges()
        }
    }
    
    func stopLocationUpdate() {
        if CLLocationManager.locationServicesEnabled() {
            manager.stopUpdatingLocation()
        }
    }
    
    deinit {
        stopLocationUpdate()
    }
    
    func permision() {
        switch CLLocationManager.authorizationStatus() {
        case .restricted, .notDetermined:
            manager.requestWhenInUseAuthorization()
        case .authorizedAlways, .authorizedWhenInUse:
            startLocationUpdate()
        case .denied:
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0) {
            LocationPermissionViewController.present()
        }
        break
        @unknown default:
            break
        }
    }
}

extension AppLocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.lastKnownLocation = locations.last?.coordinate
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        permision()
    }
}

extension CLLocationCoordinate2D: Equatable {
    public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
}
