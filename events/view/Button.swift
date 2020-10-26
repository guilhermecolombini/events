//
//  Button.swift
//  events
//
//  Created by Guilherme Colombini on 24/10/20.
//  Copyright © 2020 Guilherme Colombini. All rights reserved.
//

import UIKit

class Button: UIButton {
    enum ButtonStyle {
        case filled
    }
    
    enum ButtonSize {
        case small
    }
    
    var style: ButtonStyle = .filled {
        didSet { updateStyle() }
    }
    
    var size: ButtonSize = .small {
        didSet { updateSize() }
    }
    
    var shouldUpdateLayout = true
    var heightConstraint: NSLayoutConstraint?
    
    convenience init(
        title: String? = nil,
        style: ButtonStyle = .filled,
        size: ButtonSize = .small
    ) {
        self.init(frame: .zero)
        
        shouldUpdateLayout = false
        setTitle(title, for: .normal)
        self.style = style
        self.size = size
        shouldUpdateLayout = true
        
        customizeViews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupComponent()
        customizeViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupComponent() {
        translatesAutoresizingMaskIntoConstraints = false
        heightConstraint = heightAnchor.constraint(equalToConstant: 45.0)
        heightConstraint?.isActive = true
        
        layer.borderWidth = 1.5
        layer.cornerRadius = 8
    }
    
    func customizeViews() {
        guard shouldUpdateLayout else { return }
        
        updateStyle()
        updateSize()
    }
    
    func updateStyle() {
        switch (style) {
        case .filled:
            layer.borderColor = Palette.Button.filled.color.cgColor
            backgroundColor = Palette.Button.filled.color
            titleLabel?.textColor = Palette.Button.filled.color
        }
    }
    
    func updateSize() {
        guard shouldUpdateLayout,
            let heightConstraint = heightConstraint else { return }
        
        switch size {
        case .small:
            heightConstraint.constant = 45.0
        }
    }
}
