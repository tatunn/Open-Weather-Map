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
    }
    
    private func setupControllers() {
        let today = TodayViewController()
        today.createItem(title: "Today", image: UIImage(named: "tab_today"))
        
        let forecast = ForeCastViewController()
        forecast.createItem(title: "Forecast", image: UIImage(named: "tab_forecast"))
        
        self.viewControllers = [AppNavigationController(rootViewController: today),
                                AppNavigationController(rootViewController: forecast)]
    }
}
