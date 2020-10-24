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
        return "\(event.price)"
    }
    
    func date() -> String {
        return "\(event.date)"
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
