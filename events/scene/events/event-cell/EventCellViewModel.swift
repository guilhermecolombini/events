//
//  EventCellViewModel.swift
//  events
//
//  Created by Guilherme Colombini on 26/10/20.
//  Copyright © 2020 Guilherme Colombini. All rights reserved.
//

import Foundation

struct EventCellViewModel {
    let event: Event
    
    func title() -> String {
        return event.title
    }
    
    func price() -> String {
        let currencyFormat = CurrencyFormat()
        return currencyFormat.applyCurrency(in: event.price)
    }
    
    func date() -> String {
        let dateFormat = DateFormat(with: event.date)
        return dateFormat.formattedDate()
    }
}
