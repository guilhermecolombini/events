//
//  EventDetailsViewModel.swift
//  events
//
//  Created by Guilherme Colombini on 24/10/20.
//  Copyright © 2020 Guilherme Colombini. All rights reserved.
//

import Foundation
import RxSwift

class EventDetailsViewModel {
    let event: Event
    let disposeBag = DisposeBag()
    
    let checkinPublish = PublishSubject<Checkin>()
    let errorPublish = PublishSubject<ServiceError>()
    
    init(event: Event) {
        self.event = event
    }
    
    func title() -> String {
        return event.title
    }
    
    func overview() -> String {
        return event.overview
    }
    
    func price() -> String {
        let currencyFormat = CurrencyFormat()
        return currencyFormat.applyCurrency(in: event.price)
    }
    
    func date() -> String {
        let dateFormat = DateFormat(with: event.date)
        return dateFormat.formattedDate()
    }
    
    func checkin() {
        let service = Service()
        service.request(endpoint: EventAPI.checkin(id: event.id, name: "test", email: "test"))
            .subscribe(onNext: { [weak self] (result: Result<Checkin, ServiceError>) in
                guard let self = self else { return }
                
                switch (result) {
                case .success(let checkin):
                    self.checkinPublish.onNext(checkin)
                    
                case .failure(let error):
                    self.errorPublish.onNext(error)
                }
            })
            .disposed(by: disposeBag)
    }
}
