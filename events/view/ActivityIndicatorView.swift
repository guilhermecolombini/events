//
//  ActivityIndicatorView.swift
//  events
//
//  Created by Guilherme Colombini on 26/10/20.
//  Copyright © 2020 Guilherme Colombini. All rights reserved.
//

import UIKit

class ActivityIndicatorView: UIView {
    var activityIndicator: UIActivityIndicatorView!
    
    init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.color = .gray
        
        addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startAnimating () {
        activityIndicator.startAnimating()
    }
    
    func stopAnimating () {
        activityIndicator.stopAnimating()
    }
}
