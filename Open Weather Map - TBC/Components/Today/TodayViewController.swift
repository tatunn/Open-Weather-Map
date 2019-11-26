//
//  TodayViewController.swift
//  Open Weather Map - TBC
//
//  Created by Nikoloz Tatunashvili on 11/26/19.
//  Copyright © 2019 Nikoloz TatunaSvili. All rights reserved.
//

import UIKit

class TodayViewController: UITableViewController {

    private let viewModel = TodayViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(names: ButtonCell.self, WeatherMainCell.self, WeatherHeaderCell.self)
        
        viewModel.loader.bindAndFire { [weak self] in
            if $0 { self?.showLoader() } else { self?.hideLoader() }
        }
        
        viewModel.error.bindAndFire { [weak self] in
            if let error = $0 { self?.notifyError(error) }
        }
        
        viewModel.entity.bindAndFire { [weak self] in
            self?.setup(with: $0)
        }
        
        viewModel.fetchData()
    }
    
    private func setup(with item: WeatherEntity?) {
        guard let item = item else {
            return
        }
        self.title = item.name
    }
}

extension TodayViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
}
