//
//  Object.swift
//  Open Weather Map - TBC
//
//  Created by Nikoloz Tatunashvili on 11/26/19.
//  Copyright © 2019 Nikoloz TatunaSvili. All rights reserved.
//

import Foundation

public extension NSObject {
    var className: String {
        return String(describing: type(of: self))
    }
    
    class var className: String {
        return String(describing: self)
    }
}
