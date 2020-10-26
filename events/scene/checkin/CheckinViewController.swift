//
//  CheckinViewController.swift
//  events
//
//  Created by Guilherme Colombini on 26/10/20.
//  Copyright © 2020 Guilherme Colombini. All rights reserved.
//

import UIKit
import RxSwift

class CheckinViewController: UIViewController {
    let checkinView: CheckinView
    let viewModel: CheckinViewModel
    let disposeBag = DisposeBag()
    
    init(with event: Event) {
        checkinView = CheckinView()
        viewModel = CheckinViewModel(with: event)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Check-In"
        view.backgroundColor = .white
        
        setupView()
        bindUI()
    }
    
    func setupView() {
        view.addSubview(checkinView)
        NSLayoutConstraint.activate([
            checkinView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            checkinView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            checkinView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            checkinView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func bindUI() {
        viewModel.checkinPublish
            .subscribe(onNext: { [weak self] checkin in
                guard let self = self else { return }
                
                if (checkin.code == "200") {
                    self.presentAlert(with: "Sucesso", message: "Check-in realizado", actionTitle: "Ok") {
                        self.dismiss(animated: true)
                    }
                }
                else {
                    self.presentAlert(with: "Error", message: "Falha ao realizar o check-in", actionTitle: "Ok")
                }
            })
            .disposed(by: disposeBag)
        
        viewModel.isLoading
            .subscribe(onNext: { [weak self] isLoading in
                guard let self = self else { return }
                self.checkinView.isLoading = isLoading
            })
            .disposed(by: disposeBag)
        
        viewModel.errorPublish
            .subscribe(onNext: { [weak self] error in
                guard let self = self else { return }
                self.presentAlert(with: error)
            })
            .disposed(by: disposeBag)
        
        checkinView.nameTextField.rx.text
            .orEmpty
            .bind(to: viewModel.nameRelay)
            .disposed(by: disposeBag)
        
        checkinView.emailTextField.rx.text
            .orEmpty
            .bind(to: viewModel.emailRelay)
            .disposed(by: disposeBag)
        
        checkinView.confirmButton.rx.tap
            .bind { [weak self] in
                guard let self = self else { return }
                self.viewModel.checkin()
            }
            .disposed(by: disposeBag)
    }
}
