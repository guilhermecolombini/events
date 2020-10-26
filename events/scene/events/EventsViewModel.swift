//
//  EventViewModel.swift
//  events
//
//  Created by Guilherme Colombini on 23/10/20.
//  Copyright © 2020 Guilherme Colombini. All rights reserved.
//

import Foundation
import RxSwift

class EventsViewModel {
    let disposeBag = DisposeBag()
    private var events: [Event] = []
    
    let eventsPublish = PublishSubject<[EventCellViewModel]>()
    let errorPublish = PublishSubject<ServiceError>()
    
    func fetchEvents() {
        let service = Service()
        service.request(endpoint: EventAPI.events)
            .subscribe(onNext: { [weak self] (result: Result<[Event], ServiceError>) in
                guard let self = self else { return }
                switch (result) {
                case .success(let events):
                    self.events = events
                    self.eventsPublish.onNext(events.map({ EventCellViewModel(event: $0) }))
                    
                case .failure(let error):
                    self.errorPublish.onNext(error)
                }
            })
            .disposed(by: disposeBag)
    }
    
    func event(from row: Int) -> Event {
        return events[row]
    }
}
