//
//  ButtonCell.swift
//  Open Weather Map - TBC
//
//  Created by Nikoloz Tatunashvili on 11/26/19.
//  Copyright © 2019 Nikoloz TatunaSvili. All rights reserved.
//

import UIKit

class ButtonCell: UITableViewCell, AppTableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    func configure(with item: AppCellDataProvider) {
        guard let model = item as? ButtonCellDataModel else {
            return
        }
        titleLabel.text = model.title
    }
}

class ButtonCellDataModel: AppCellDataProvider {
    
    let title: String
    
    init(title: String) {
        self.title = title
    }
    
    var identifier: String {
        return ButtonCell.className
    }
}
