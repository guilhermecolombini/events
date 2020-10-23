//
//  EventAPI.swift
//  events
//
//  Created by Guilherme Colombini on 23/10/20.
//  Copyright © 2020 Guilherme Colombini. All rights reserved.
//

import Foundation

enum EventAPI {
    case events
    case event(id: String)
    case checkin(id: String, name: String, email: String)
}

extension EventAPI: APIProtocol {
    var url: URL? {
        return URL(string: self.path)
    }
    
    var httpMethod: HttpMethod {
        switch (self) {
        case .events:
            return .get
        case .event:
            return .get
        case .checkin:
            return .post
        }
    }
    
    var header: [String : String]? {
        switch (self) {
        case .event, .events:
            return nil
        case .checkin(let id, let name, let email):
            return [
                "id": id,
                "name": name,
                "email": email
            ]
        }
    }
    
    var address: String {
        return "http://5f5a8f24d44d640016169133.mockapi.io/api/"
    }
    
    var path: String {
        switch (self) {
        case .events:
            return address + "events"
        case .event(id: let id):
            return address + "events/" + id
        case .checkin:
            return address + "checkin"
        }
    }
}
