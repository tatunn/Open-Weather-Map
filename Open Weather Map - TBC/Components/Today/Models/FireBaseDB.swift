//
//  FireBaseDB.swift
//  Open Weather Map - TBC
//
//  Created by Nikoloz Tatunashvili on 11/30/19.
//  Copyright © 2019 Nikoloz TatunaSvili. All rights reserved.
//

import Firebase

class FireBaseDB {
    private var ref: DatabaseReference!

    static let shared = FireBaseDB()
    
    private init() {
        ref = Database.database().reference()
    }
    
    func save(location lat: Double, lon: Double, temp: Double) {
        let value = [
            "Date": Date().timeIntervalSince1970,
            "latitude": lat,
            "longitude": lon,
            "temp": temp
        ]
        self.ref.child("Data").childByAutoId().setValue(value)
    }
}
