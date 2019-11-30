//
//  WeatherHeaderCell.swift
//  Open Weather Map - TBC
//
//  Created by Nikoloz Tatunashvili on 11/26/19.
//  Copyright © 2019 Nikoloz TatunaSvili. All rights reserved.
//

import UIKit

class WeatherHeaderCell: UITableViewCell, AppTableViewCell {
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func configure(with item: AppCellDataProvider) {
        guard let model = item as? WeatherHeaderCellDataModel else {
            return
        }
        titleLabel.text = model.title
        subTitleLabel.text = model.subTitle
        avatar.downloadImage(with: model.icon)
    }
}

class WeatherHeaderCellDataModel: AppCellDataProvider {
    
    let icon: URL?
    let title: String
    let subTitle: String
    
    init(title: String, subTitle: String, icon: URL?) {
        self.title = title
        self.subTitle = subTitle
        self.icon = icon
    }
    
    var identifier: String {
        WeatherHeaderCell.className
    }
}
