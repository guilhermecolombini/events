//
//  EventDetailsViewModel.swift
//  events
//
//  Created by Guilherme Colombini on 24/10/20.
//  Copyright © 2020 Guilherme Colombini. All rights reserved.
//

import Foundation
import RxSwift

class EventDetailsViewModel {
    let event: Event
    let disposeBag = DisposeBag()
    
    init(event: Event) {
        self.event = event
    }
    
    func title() -> String {
        return event.title
    }
    
    func overview() -> String {
        return event.overview
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
