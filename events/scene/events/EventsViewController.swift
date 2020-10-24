//
//  EventsViewController.swift
//  events
//
//  Created by Guilherme Colombini on 23/10/20.
//  Copyright © 2020 Guilherme Colombini. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class EventsViewController: UIViewController {
    let viewModel = EventViewModel()
    let eventsView = EventsView()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Eventos"
        view.backgroundColor = .white
        
        view.addSubview(eventsView)
        NSLayoutConstraint.activate([
            eventsView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            eventsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            eventsView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            eventsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
        bindUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.fetchEvents()
    }
    
    func bindUI() {
        viewModel.eventsPublish
            .bind(to: eventsView.tableView.rx.items(cellIdentifier: "EventTableViewCell", cellType: EventTableViewCell.self)) { _, event, cell in
                cell.setContent(event)
            }
            .disposed(by: disposeBag)
    }
}
