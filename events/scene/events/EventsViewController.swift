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
    let eventsView: EventsView
    let viewModel: EventViewModel
    let disposeBag: DisposeBag
    
    init() {
        eventsView = EventsView()
        viewModel = EventViewModel()
        disposeBag = DisposeBag()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Eventos"
        view.backgroundColor = .white
        
        setupView()
        bindUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.fetchEvents()
    }
    
    func setupView() {
        view.addSubview(eventsView)
        NSLayoutConstraint.activate([
            eventsView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            eventsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            eventsView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            eventsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    func bindUI() {
        viewModel.eventsPublish
            .bind(to: eventsView.tableView.rx.items(cellIdentifier: "EventTableViewCell", cellType: EventTableViewCell.self)) { _, event, cell in
                cell.setContent(event)
            }
            .disposed(by: disposeBag)
        
        eventsView.tableView.rx.modelSelected(Event.self)
            .subscribe(onNext: { [weak self] event in
                guard let self = self else { return }
                self.routeToEventsDetail(event)
            })
            .disposed(by: disposeBag)
    }
    
    func routeToEventsDetail(_ event: Event) {
        navigationController?.pushViewController(EventDetailsViewController(with: event), animated: true)
    }
}
