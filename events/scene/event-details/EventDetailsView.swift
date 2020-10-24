//
//  EventDetailsView.swift
//  events
//
//  Created by Guilherme Colombini on 24/10/20.
//  Copyright © 2020 Guilherme Colombini. All rights reserved.
//

import UIKit

class EventDetailsView: UIView {
    var scrollView: UIScrollView!
    var titleLabel: UILabel!
    var overviewLabel: UILabel!
    var priceLabel: UILabel!
    var dateLabel: UILabel!
    var checkinButton: UIButton!
    var shareButton: UIButton!
    
    init() {
        super.init(frame: .zero)
        
        instantiateViews()
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func instantiateViews() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        
        scrollView = UIScrollView(frame: .zero)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .clear
        
        titleLabel = UILabel(frame: .zero)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 0
        
        overviewLabel = UILabel(frame: .zero)
        overviewLabel.translatesAutoresizingMaskIntoConstraints = false
        overviewLabel.numberOfLines = 0
        
        priceLabel = UILabel(frame: .zero)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        dateLabel = UILabel(frame: .zero)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.textAlignment = .right
        
        checkinButton = UIButton(frame: .zero)
        checkinButton.translatesAutoresizingMaskIntoConstraints = false
        checkinButton.setTitle("Check-in", for: .normal)
        
        shareButton = UIButton(frame: .zero)
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        shareButton.setTitle("Compartihar", for: .normal)
    }
    
    func buildViewHierarchy() {
        addSubview(scrollView)
        scrollView.addSubviews([
            titleLabel,
            overviewLabel,
            priceLabel,
            dateLabel,
            shareButton,
            checkinButton
        ])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            overviewLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            overviewLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            overviewLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            priceLabel.widthAnchor.constraint(equalTo: dateLabel.widthAnchor),
            priceLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            priceLabel.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor, constant: 8),
            dateLabel.centerYAnchor.constraint(equalTo: priceLabel.centerYAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 8),
            dateLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            checkinButton.widthAnchor.constraint(equalTo: shareButton.widthAnchor),
            checkinButton.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            checkinButton.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 8),
            checkinButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            shareButton.centerYAnchor.constraint(equalTo: checkinButton.centerYAnchor),
            shareButton.leadingAnchor.constraint(equalTo: checkinButton.trailingAnchor, constant: 8),
            shareButton.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        ])
    }
}
