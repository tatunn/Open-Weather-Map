//
//  UIview.swift
//  Open Weather Map - TBC
//
//  Created by Nikoloz Tatunashvili on 11/26/19.
//  Copyright © 2019 Nikoloz TatunaSvili. All rights reserved.
//

import UIKit

extension UIView {
    
    @objc
    open func addFullSubview(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
        view.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        view.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        view.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    }
    
    @discardableResult
    func showLoader(withBackground: Bool = true) -> UIActivityIndicatorView {
        let loader = UIActivityIndicatorView(style: .whiteLarge)
        if withBackground {
            loader.heightAnchor.constraint(equalToConstant: 80).isActive = true
            loader.widthAnchor.constraint(equalToConstant: 80).isActive = true
            loader.layer.cornerRadius = 4
            loader.layer.masksToBounds = true
            loader.backgroundColor = UIColor.gray.withAlphaComponent(0.3)
        }
        self.addSubview(loader)
        loader.translatesAutoresizingMaskIntoConstraints = false
        loader.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        loader.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        loader.startAnimating()
        self.layoutIfNeeded()
        loader.hidesWhenStopped = true
        self.isUserInteractionEnabled = false
        return loader
    }
    
    func hideLoader() {
        self.isUserInteractionEnabled = true
        let loader = (self.subviews.first(where: { $0 is UIActivityIndicatorView }) as? UIActivityIndicatorView)
        loader?.stopAnimating()
        loader?.removeFromSuperview()
    }
    
    func shake(completion: VoidFunction?) {
        CATransaction.begin()
        CATransaction.setCompletionBlock({
            completion?()
        })
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = 0.4
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        layer.add(animation, forKey: "shake")
        CATransaction.commit()
    }
}


