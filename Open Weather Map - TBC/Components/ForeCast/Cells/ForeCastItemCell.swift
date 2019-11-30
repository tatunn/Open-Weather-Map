//
//  ForeCastItemCell.swift
//  Open Weather Map - TBC
//
//  Created by Nikoloz Tatunashvili on 11/30/19.
//  Copyright © 2019 Nikoloz TatunaSvili. All rights reserved.
//

import UIKit

class ForeCastItemCell: UITableViewCell, AppTableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var descrLabel: UILabel!
    @IBOutlet weak var degreeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func configure(with item: AppCellDataProvider) {
        guard let model = item as? ForeCastItemCellDataModel else {
            return
        }
        avatarImageView.downloadImage(with: model.avatar)
        timeLabel.text = model.time
        descrLabel.text = model.descr
        degreeLabel.text = model.degree
    }
    
    
}

class ForeCastItemCellDataModel: AppCellDataProvider {
    
    let avatar: URL?
    let time: String?
    let descr: String?
    let degree: String?
    
    init(avatar: URL?, time: String?, descr: String?, degree: String?) {
        self.avatar = avatar
        self.time = time
        self.descr = descr
        self.degree = degree
    }
    
    
    var identifier: String {
        return ForeCastItemCell.className
    }
}
