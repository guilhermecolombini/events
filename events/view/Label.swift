//
//  Label.swift
//  events
//
//  Created by Guilherme Colombini on 24/10/20.
//  Copyright © 2020 Guilherme Colombini. All rights reserved.
//

import UIKit

class Label: UILabel {
    public enum Style {
        case title, body
    }
    
    var style: Style = .body {
        didSet { updateStyle() }
    }
    
    var customTextColor: UIColor? {
        didSet { updateStyle() }
    }
    
    override var text: String? {
        set {
            super.text = newValue
            updateStyle()
        }
        get { return super.text }
    }
    
    var shouldUpdateLayout: Bool = true
    
    // MARK: - Initialization
    public convenience init(
        text: String? = nil,
        style: Style = .body,
        customTextColor: UIColor? = nil,
        textAlignment: NSTextAlignment = .left
    ) {
        self.init(frame: .zero)
        shouldUpdateLayout = false
        self.text = text
        self.style = style
        self.customTextColor = customTextColor
        self.textAlignment = textAlignment
        shouldUpdateLayout = true
        customizeViews()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        customizeViews()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func customizeViews() {
        guard shouldUpdateLayout else { return }
        updateStyle()
    }
    
    func updateStyle() {
        switch (style) {
        case .title:
            textColor = Typography.title.color
            font = Typography.title.font
            
        case .body:
            textColor = Typography.body.color
            font = Typography.body.font
        }
        
        if let customTextColor = customTextColor {
            textColor = customTextColor
        }
    }
}
