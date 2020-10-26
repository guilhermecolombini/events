//
//  EventTableViewCell.swift
//  events
//
//  Created by Guilherme Colombini on 23/10/20.
//  Copyright © 2020 Guilherme Colombini. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {
    var titleLabel: Label!
    var priceLabel: Label!
    var dateLabel: Label!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        instantiateViews()
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func instantiateViews() {
        selectionStyle = .none
        
        titleLabel = Label(style: .title)
        priceLabel = Label(style: .body)
        dateLabel = Label(style: .body)
    }
    
    func buildViewHierarchy() {
        contentView.addSubviews([
            titleLabel,
            priceLabel,
            dateLabel
        ])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            priceLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            priceLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            dateLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 8),
            dateLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
        ])
    }
}
