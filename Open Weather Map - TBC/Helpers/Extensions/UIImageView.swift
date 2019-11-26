//
//  UIImageView.swift
//  Open Weather Map - TBC
//
//  Created by Nikoloz Tatunashvili on 11/26/19.
//  Copyright © 2019 Nikoloz TatunaSvili. All rights reserved.
//

import UIKit
import SDWebImage

extension UIImageView {
    func downloadImage(with url: URL?, placeholder: UIImage? = nil) {
        self.sd_setImage(with: url, placeholderImage: placeholder) { (i: UIImage?, e: Error?, s: SDImageCacheType, u: URL?) in
            if let image = i, s == SDImageCacheType.none {
                self.alpha = 0
                UIView.transition(with: self, duration: 0.3,
                                  options: .transitionCrossDissolve, animations: {
                                    self.image = image
                                    self.alpha = 1
                }, completion: nil)
            }
            else {
                self.alpha = 1
            }
        }
    }
}
