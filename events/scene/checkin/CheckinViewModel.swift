//
//  CheckinViewModel.swift
//  events
//
//  Created by Guilherme Colombini on 26/10/20.
//  Copyright © 2020 Guilherme Colombini. All rights reserved.
//

import Foundation
import RxSwift
import RxRelay

class CheckinViewModel {
    private let event: Event
    let disposeBag = DisposeBag()
    
    let nameRelay = BehaviorRelay<String>(value: "")
    let emailRelay = BehaviorRelay<String>(value: "")
    
    let checkinPublish = PublishSubject<Checkin>()
    let errorPublish = PublishSubject<ServiceError>()
    
    init(with event: Event) {
        self.event = event
    }
    
    func checkin() {
        let service = Service()
        service.request(endpoint: EventAPI.checkin(id: event.id, name: nameRelay.value, email: emailRelay.value))
            .subscribe(onNext: { [weak self] (result: Result<Checkin, ServiceError>) in
                guard let self = self else { return }
                
                DispatchQueue.main.async {
                    switch (result) {
                    case .success(let checkin):
                        self.checkinPublish.onNext(checkin)
                        
                    case .failure(let error):
                        self.errorPublish.onNext(error)
                    }
                }
            })
            .disposed(by: disposeBag)
    }
}
