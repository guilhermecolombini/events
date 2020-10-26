//
//  EventDetailsViewController.swift
//  events
//
//  Created by Guilherme Colombini on 24/10/20.
//  Copyright © 2020 Guilherme Colombini. All rights reserved.
//

import UIKit
import RxSwift

class EventDetailsViewController: UIViewController {
    let eventDetailsView: EventDetailsView
    let viewModel: EventDetailsViewModel
    let disposeBag = DisposeBag()
    
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
        
        viewModel.checkinPublish
            .subscribe(onNext: { [weak self] checkin in
                guard let self = self else { return }
                
                if (checkin.code == "200") {
                    self.presentAlert(with: "Sucesso", message: "Check-in realizado", actionTitle: "Ok")
                }
                else {
                    self.presentAlert(with: "Error", message: "Falha ao realizar o check-in", actionTitle: "Ok")
                }
            })
            .disposed(by: disposeBag)
        
        viewModel.errorPublish
            .subscribe(onNext: { [weak self] error in
                guard let self = self else { return }
                self.presentAlert(with: error)
            })
            .disposed(by: disposeBag)
        
        eventDetailsView.shareButton.rx.tap
            .bind {[weak self] in
                guard let self = self else { return }
                self.presentShareViewController()
            }
            .disposed(by: disposeBag)
    }
    
    func presentShareViewController() {
        let activityViewController = UIActivityViewController(activityItems: [viewModel.title(), viewModel.price(), viewModel.date()], applicationActivities: nil)
        activityViewController.isModalInPresentation = true
        present(activityViewController, animated: true, completion: nil)
    }
}
