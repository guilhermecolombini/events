//
//  Event.swift
//  events
//
//  Created by Guilherme Colombini on 24/10/20.
//  Copyright © 2020 Guilherme Colombini. All rights reserved.
//

import Foundation

struct Event: Decodable {
    let id: String
    let title: String
    let overview: String
    let price: Double
    let date: Int
    
    enum CodingKeys: String, CodingKey {
        case overview = "description"
        case id, title, price, date
    }
}
