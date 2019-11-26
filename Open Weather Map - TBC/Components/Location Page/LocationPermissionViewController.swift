//
//  LocationPermissionViewController.swift
//  Open Weather Map - TBC
//
//  Created by Nikoloz Tatunashvili on 11/26/19.
//  Copyright © 2019 Nikoloz TatunaSvili. All rights reserved.
//

import UIKit

class LocationPermissionViewController: UIViewController {
    
    @IBAction func setingsAction() {
        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
    }

}

extension LocationPermissionViewController {
    static func present() {
        guard let window = UIApplication.shared.keyWindow else {
            return
        }

        let me = LocationPermissionViewController()
        
        window.rootViewController = me
        
        let options: UIView.AnimationOptions = .transitionCurlDown
        let duration: TimeInterval = 0.3

        UIView.transition(with: window, duration: duration, options: options, animations: nil, completion: nil)
    }
}
