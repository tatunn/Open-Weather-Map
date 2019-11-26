//
//  TableView.swift
//  Open Weather Map - TBC
//
//  Created by Nikoloz Tatunashvili on 11/26/19.
//  Copyright © 2019 Nikoloz TatunaSvili. All rights reserved.
//

import UIKit

extension UITableView {
    func register(names: UITableViewCell.Type...) {
        names.forEach {
            self.register(UINib(nibName: $0.className, bundle: nil),
                          forCellReuseIdentifier: $0.className)
        }
    }
}
