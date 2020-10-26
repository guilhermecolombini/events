//
//  EventsView.swift
//  events
//
//  Created by Guilherme Colombini on 23/10/20.
//  Copyright © 2020 Guilherme Colombini. All rights reserved.
//

import UIKit

class EventsView: UIView {
    var tableView: UITableView!
    var loadingView: ActivityIndicatorView!
    
    var isLoading = false {
        didSet {
            if (isLoading) {
                startAnimating()
            }
            else {
                stopAnimating()
            }
        }
    }
    
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
        
        tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.register(EventTableViewCell.self, forCellReuseIdentifier: "EventTableViewCell")
        
        loadingView = ActivityIndicatorView()
    }
    
    func buildViewHierarchy() {
        addSubviews([
            tableView,
            loadingView
        ])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            loadingView.leadingAnchor.constraint(equalTo: leadingAnchor),
            loadingView.topAnchor.constraint(equalTo: topAnchor),
            loadingView.trailingAnchor.constraint(equalTo: trailingAnchor),
            loadingView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func startAnimating () {
        loadingView.isHidden = false
        loadingView.startAnimating()
    }

    func stopAnimating () {
        loadingView.isHidden = true
        loadingView.stopAnimating()
    }
}
