//
//  DateFormat.swift
//  events
//
//  Created by Guilherme Colombini on 26/10/20.
//  Copyright © 2020 Guilherme Colombini. All rights reserved.
//

import Foundation

class DateFormat {
    var dateFormatter: DateFormatter
    var date: Date?
    
    convenience init(with epochTime: Int) {
        self.init()
        
        if let timeInverval = TimeInterval(exactly: epochTime) {
            self.date = Date(timeIntervalSince1970: timeInverval)
        }
    }
    
    init() {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateStyle = .short

        self.dateFormatter = dateFormatter
    }
    
    func formattedDate() -> String {
        if let date = date  {
            return dateFormatter.string(from: date)
        }
        else {
            return "--------"
        }
    }
}
