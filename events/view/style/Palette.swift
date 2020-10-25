//
//  Palette.swift
//  events
//
//  Created by Guilherme Colombini on 24/10/20.
//  Copyright © 2020 Guilherme Colombini. All rights reserved.
//

import UIKit

enum Palette {
    enum Label {
        case primary, secondary
        
        var color: UIColor {
            switch (self) {
            case .primary:
                return .black
                
            case .secondary:
                return .darkGray
            }
        }
    }
    
    enum Button {
        case filled
        
        var color: UIColor {
            switch (self) {
            case .filled:
                return .systemBlue
            }
        }
        
        var fontColor: UIColor {
            switch (self) {
            case .filled:
                return .white
            }
        }
    }
}
