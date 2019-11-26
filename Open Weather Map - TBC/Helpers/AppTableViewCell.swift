//
//  AppTableViewCell.swift
//  Open Weather Map - TBC
//
//  Created by Nikoloz Tatunashvili on 11/26/19.
//  Copyright © 2019 Nikoloz TatunaSvili. All rights reserved.
//

import UIKit

protocol AppTableViewCell: UITableViewCell {
    func configure(with item: AppCellDataProvider)
}

protocol AppCellDataProvider: class {
    var identifier: String { get }
}

extension UITableView {
    func dequeueReusable(dataProvider: AppCellDataProvider, for indexPath: IndexPath) -> AppTableViewCell {
        return dequeueReusableCell(withIdentifier: dataProvider.identifier, for: indexPath) as! AppTableViewCell
    }
}
