//
//  Date.swift
//  Open Weather Map - TBC
//
//  Created by Nikoloz Tatunashvili on 11/30/19.
//  Copyright © 2019 Nikoloz TatunaSvili. All rights reserved.
//

import Foundation

extension Date {
    var WeekDayName: String {
        let cal = Calendar.current
        if cal.isDateInToday(self) {
            return "Today"
        }
        return cal.weekdaySymbols[cal.component(.weekday, from: self) - 1]
    }
    
    var timeTitle: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: self)
    }
}
