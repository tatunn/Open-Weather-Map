//
//  MainTabBarViewController.swift
//  Open Weather Map - TBC
//
//  Created by Nikoloz Tatunashvili on 11/26/19.
//  Copyright © 2019 Nikoloz TatunaSvili. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()

        RadioAccessTechnology.shared.delegate = self
        try? RadioAccessTechnology.shared.reachability?.startNotifier()
//        self.didChange(to: RadioAccessTechnology.shared.currentState)
    }
    
    private func setupControllers() {
        let today = TodayViewController()
        today.createItem(title: "Today", image: UIImage(named: "tab_today"))
        
        let forecast = ForeCastViewController()
        forecast.createItem(title: "Forecast", image: UIImage(named: "tab_forecast"))
        
        self.viewControllers = [AppNavigationController(rootViewController: today),
                                AppNavigationController(rootViewController: forecast)]
    }
    
    private func presentOffline() {
        let vc = OfflineViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    private func tryDissmisOffline() {
        self.setupControllers()
        if self.presentedViewController is OfflineViewController {
            self.presentedViewController?.dismiss(animated: true, completion: nil)
        }
    }
}

extension MainTabBarViewController: RadioAccessTechnologyNotifierDelegate {
    func didChange(to state: RadioAccessTechnology.State) {
        switch state {
        case .unknown:
            DispatchQueue.main.async {
                self.presentOffline()
            }
        default:
            DispatchQueue.main.async {
                self.tryDissmisOffline()
            }
        }
    }
}
