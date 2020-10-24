//
//  ServiceError.swift
//  events
//
//  Created by Guilherme Colombini on 23/10/20.
//  Copyright © 2020 Guilherme Colombini. All rights reserved.
//

import Foundation

enum ServiceError: Error {
    case unknown
    case url
    case decoding
    case data
    case connection
    case internalError
    case badRequest
    
    var localizedDescription: String {
        switch (self) {
        case .unknown:
            return "Erro desconhecido"
        case .url:
            return "Endereço incorreto"
        case .decoding:
            return "Falha no parse"
        case .data:
            return "Erro na resposta"
        case .connection:
            return "Falha ao conectar"
        case .internalError:
            return "Falha no servidor"
        case .badRequest:
            return "Bad request"
        }
    }
}
