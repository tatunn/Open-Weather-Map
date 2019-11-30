//
//  ForeCastViewController.swift
//  Open Weather Map - TBC
//
//  Created by Nikoloz Tatunashvili on 11/26/19.
//  Copyright © 2019 Nikoloz TatunaSvili. All rights reserved.
//

import UIKit

class ForeCastViewController: UITableViewController {

    private let viewModel = ForeCastViewModel()
    
    fileprivate var dataProviders: [ForeCastTableDataSource] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.separatorStyle = .none
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        tableView.register(names: ForeCastItemCell.self)
        
        viewModel.loader.bindAndFire { [weak self] in
            if $0 { self?.showLoader() } else { self?.hideLoader() }
        }
        
        viewModel.error.bindAndFire { [weak self] in
            if let error = $0 { self?.notifyError(error) }
        }
        
        viewModel.entity.bind { [weak self] in
            self?.setup(with: $0)
        }
        
        viewModel.fetchData()
    }

    private func setup(with item: ForeCastEntity?) {
        self.title = item?.city?.name
        var result: [ForeCastTableDataSource] = []
        item?.prettyList.forEach({ listItem in
            let model = ForeCastItemCellDataModel(avatar: Api.imageUrl(path: listItem.prettyIcon), time: listItem.prettyDate.timeTitle, descr: listItem.prettyDesc, degree: listItem.prettyTemp)
        
            if let provider = result.first(where: {$0.section == listItem.prettyDate.WeekDayName }) {
                provider.cells.append(model)
            } else {
                result.append(ForeCastTableDataSource(section: listItem.prettyDate.WeekDayName, cells: [model]))
            }
        })
        dataProviders = result
    }
}

extension ForeCastViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return dataProviders.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataProviders[section].cells.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = dataProviders[indexPath.section].cells[indexPath.row]
        let cell = tableView.dequeueReusable(dataProvider: model, for: indexPath)
        cell.configure(with: model)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dataProviders[section].section
    }
}
