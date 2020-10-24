//
//  EventDetailsViewController.swift
//  events
//
//  Created by Guilherme Colombini on 24/10/20.
//  Copyright © 2020 Guilherme Colombini. All rights reserved.
//

import UIKit

class EventDetailsViewController: UIViewController {
    let eventDetailsView: EventDetailsView
    let viewModel: EventDetailsViewModel
    
    init(with event: Event) {
        eventDetailsView = EventDetailsView()
        viewModel = EventDetailsViewModel(event: event)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Evento"
        view.backgroundColor = .white
        
        setupView()
        bindUI()
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
    
    func bindUI() {
        eventDetailsView.titleLabel.text = viewModel.title()
        eventDetailsView.overviewLabel.text = viewModel.overview()
        eventDetailsView.priceLabel.text = viewModel.price()
        eventDetailsView.dateLabel.text = viewModel.date()
    }
}
