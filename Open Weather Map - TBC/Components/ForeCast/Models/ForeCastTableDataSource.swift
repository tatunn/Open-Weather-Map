//
//  ForeCastTableDataSource.swift
//  Open Weather Map - TBC
//
//  Created by Nikoloz Tatunashvili on 11/30/19.
//  Copyright © 2019 Nikoloz TatunaSvili. All rights reserved.
//

import Foundation

class ForeCastTableDataSource {
    let section: String
    var cells: AppCellDataProviders
    
    init(section: String, cells: AppCellDataProviders) {
        self.section = section
        self.cells = cells
    }
}
