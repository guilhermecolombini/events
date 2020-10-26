//
//  Typography.swift
//  events
//
//  Created by Guilherme Colombini on 24/10/20.
//  Copyright © 2020 Guilherme Colombini. All rights reserved.
//

import UIKit

enum Typography {
    case title, body, button

    var font: UIFont {
        switch (self) {
        case .title:
            return UIFont.boldSystemFont(ofSize: 16)
            
        case .body:
            return UIFont.systemFont(ofSize: 14)
            
        case .button:
            return UIFont.boldSystemFont(ofSize: 14)
        }
    }
}
