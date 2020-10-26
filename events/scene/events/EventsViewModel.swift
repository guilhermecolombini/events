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
    let isLoading = PublishSubject<Bool>()
    
    func fetchEvents() {
        isLoading.onNext(true)
        
        let service = Service()
        service.request(endpoint: EventAPI.events)
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] (result: Result<[Event], ServiceError>) in
                guard let self = self else { return }
                
                self.isLoading.onNext(false)
                
                switch (result) {
                case .success(let events):
                    self.events = events
                    self.eventsPublish.onNext(events.map({ EventCellViewModel(event: $0) }))
                    
                case .failure(let error):
                    self.errorPublish.onNext(error)
                }
            }, onCompleted: { [weak self] in
                guard let self = self else { return }
                self.isLoading.onNext(false)
            })
            .disposed(by: disposeBag)
    }
    
    func event(from row: Int) -> Event {
        return events[row]
    }
}
