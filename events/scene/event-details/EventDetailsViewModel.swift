//
//  EventDetailsViewModel.swift
//  events
//
//  Created by Guilherme Colombini on 24/10/20.
//  Copyright © 2020 Guilherme Colombini. All rights reserved.
//

import Foundation

struct EventDetailsViewModel {
    let event: Event
    
    var title: String {
        return event.title
    }
    var overview: String {
        return event.overview
    }
    var price: String {
        return "\(event.price)"
    }
    var date: String {
        return "\(event.date)"
    }
}
