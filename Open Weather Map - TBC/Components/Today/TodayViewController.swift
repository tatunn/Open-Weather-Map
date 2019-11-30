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
    
    fileprivate var dataProviders: AppCellDataProviders = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
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
        self.title = "Today"
        
        let header = WeatherHeaderCellDataModel(title: item.prettyName, subTitle: item.prettyDescr, icon: Api.imageUrl(path: item.prettyIcon))
        let main = WeatherMainCellDataModel(humidity: item.prettyHumidity, rain: item.prettyRain, pressure: item.prettyPressure, speed: item.prettySpeed, country: item.prettyCountry)
        let button = ButtonCellDataModel(title: "Share")
        dataProviders = [header, main, button]
    }
    
    private func shareDialog() {
        let ac = UIActivityViewController(activityItems: viewModel.getShareCctivityItems(), applicationActivities: nil)
        present(ac, animated: true)
    }
}

extension TodayViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataProviders.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = dataProviders[indexPath.row]
        let cell = tableView.dequeueReusable(dataProvider: model, for: indexPath)
        cell.configure(with: model)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if dataProviders[indexPath.row] is ButtonCellDataModel {
            shareDialog()
        }
    }
}
