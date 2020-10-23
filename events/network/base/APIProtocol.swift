//
//  APIProtocol.swift
//  events
//
//  Created by Guilherme Colombini on 23/10/20.
//  Copyright © 2020 Guilherme Colombini. All rights reserved.
//

import Foundation

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
}

protocol APIProtocol {
    var url: URL? { get }
    var httpMethod: HttpMethod { get }
    var header: [String: String]? { get }
}
