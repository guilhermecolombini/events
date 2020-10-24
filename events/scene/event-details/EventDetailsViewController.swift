//
//  EventDetailsViewController.swift
//  events
//
//  Created by Guilherme Colombini on 24/10/20.
//  Copyright © 2020 Guilherme Colombini. All rights reserved.
//

import UIKit

class EventDetailsViewController: UIViewController {
    let eventDetailsView = EventDetailsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Evento"
        view.backgroundColor = .white
        
        setupView()
    }
    
    func setupView() {
        view.addSubview(eventDetailsView)
        NSLayoutConstraint.activate([
            eventDetailsView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            eventDetailsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            eventDetailsView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            eventDetailsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
