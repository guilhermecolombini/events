//
//  CurrencyFormat.swift
//  events
//
//  Created by Guilherme Colombini on 26/10/20.
//  Copyright © 2020 Guilherme Colombini. All rights reserved.
//

import Foundation

struct CurrencyFormat {
    var numberFormatter: NumberFormatter
    
    init() {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale.current
        
        self.numberFormatter = numberFormatter
    }
    
    func applyCurrency(in value: Double) -> String {
        guard let formattedPrice = numberFormatter.string(from: value as NSNumber) else {
            return "R$ 0,00"
        }
        
        return formattedPrice
    }
}
