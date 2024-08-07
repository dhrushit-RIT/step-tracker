//
//  Date+Ext.swift
//  Step Tracker
//
//  Created by Dhrushit Suresh Raval on 8/6/24.
//

import Foundation

extension Date {
    var weekdayInt: Int {
        Calendar.current.component(.weekday, from: self)
    }
    
    var weekdayTitle: String {
        self.formatted(.dateTime.weekday(.wide))
    }
}
