//
//  Dynamics.swift
//  Open Weather Map - TBC
//
//  Created by Nikoloz Tatunashvili on 11/26/19.
//  Copyright © 2019 Nikoloz TatunaSvili. All rights reserved.
//

import Foundation

open class Dynamic<T> {
    
    public typealias removableListener = (Listener?, NSObject?)
    public typealias Listener = (T) -> Void
    public fileprivate(set) var listener: [removableListener] = []
    
    open func bind(obj: NSObject? = nil, _ listener: Listener?) {
        self.listener.append((listener, obj))
    }
    
    open func bindAndFire(obj: NSObject? = nil, _ listener: Listener?) {
        self.listener.append((listener, obj))
        listener?(value)
    }
    
    open func removeBinder(obj: NSObject?) {
        if let index = self.listener.firstIndex(where: { $0.1 == obj }) {
            self.listener.remove(at: index)
        }
    }
    
    open var value: T {
        didSet {
            listener.forEach {
                $0.0?(value)
            }
        }
    }
   
    public init(_ v: T) {
        value = v
    }
}
