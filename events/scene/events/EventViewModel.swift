//
//  EventViewModel.swift
//  events
//
//  Created by Guilherme Colombini on 23/10/20.
//  Copyright © 2020 Guilherme Colombini. All rights reserved.
//

import Foundation
import RxSwift

struct EventViewModel {
    let disposeBag = DisposeBag()
    
    let eventsPublish = PublishSubject<[Event]>()
    
    func fetchEvents() {
        let service = Service()
        service.request(endpoint: EventAPI.events)
            .subscribe(onNext: { (result: Result<[Event], ServiceError>) in
                switch (result) {
                case .success(let events):
                    self.eventsPublish.onNext(events)
                    
                case .failure(let error):
                    print(error)
                }
            })
            .disposed(by: disposeBag)
    }
}
