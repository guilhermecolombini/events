//
//  EventDetailsViewModel.swift
//  events
//
//  Created by Guilherme Colombini on 24/10/20.
//  Copyright © 2020 Guilherme Colombini. All rights reserved.
//

import Foundation
import RxSwift

struct EventDetailsViewModel {
    let event: Event
    let disposeBag = DisposeBag()
    
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
            .subscribe(onNext: { (result: Result<Checkin, ServiceError>) in
                switch (result) {
                case .success(let checkin):
                    print(checkin)
                    
                case .failure(let error):
                    print(error)
                }
            })
            .disposed(by: disposeBag)
    }
}
