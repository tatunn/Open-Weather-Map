//
//  UIviewController.swift
//  Open Weather Map - TBC
//
//  Created by Nikoloz Tatunashvili on 11/26/19.
//  Copyright © 2019 Nikoloz TatunaSvili. All rights reserved.
//

import UIKit

extension UIViewController {
    func createItem(title: String?, image: UIImage?, tag: Int = 0) {
        let item = UITabBarItem(title: title, image: image, selectedImage: nil)
        item.tag = tag
        self.tabBarItem = item
        item.imageInsets = UIEdgeInsets(top: -6, left: 0, bottom: 0, right: 0)
        item.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -6)
    }
    
    func hideNavigationBar(animated: Bool = true) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func showNavigationBar(animated: Bool = true) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @discardableResult
    func showLoader(withBackground: Bool = true) -> UIActivityIndicatorView {
        self.hideLoader()
        return self.view.showLoader(withBackground: withBackground)
    }
    
    func hideLoader() {
        self.view.hideLoader()
    }
    
    func showAlert(title: String? = nil, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showMessage(title: String? = nil,
                     message: String,
                     confirmTitle: String,
                     cancelTitle: String = "app.alert.action.cancel",
                     completion: @escaping VoidFunction,
                     cancelAction: @escaping VoidFunction) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: confirmTitle, style: .default) { _ in
            DispatchQueue.main.async { completion() }
        }
        let cancel = UIAlertAction(title: cancelTitle, style: .cancel, handler: {_ in
            cancelAction()
        })
        alert.addAction(ok)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
    
    func notifyError(_ error: Error) {
        showAlert(title: "API Error", message: error.localizedDescription)
    }
    
    func showToast(message: String) {
        let toastLabel = createToastLabel(text: message)
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
    private func createToastLabel(text: String) -> UILabel {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width / 2 - 75, y: self.view.frame.size.height - 100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = UIFont.systemFont(ofSize: 17)
        toastLabel.textAlignment = .center
        toastLabel.text = text
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 18
        toastLabel.clipsToBounds = true
        return toastLabel
    }
}
