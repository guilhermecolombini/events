//
//  Service.swift
//  events
//
//  Created by Guilherme Colombini on 23/10/20.
//  Copyright © 2020 Guilherme Colombini. All rights reserved.
//

import Foundation
import RxSwift

class Service {
    func request<T: Decodable>(endpoint: APIProtocol) -> Observable<Result<T, ServiceError>> {
        return Observable<Result<T, ServiceError>>.create { observer in
            if let url = endpoint.url {
                var request = URLRequest(url: url)
                request.httpMethod = endpoint.httpMethod.rawValue
                endpoint.header?.forEach({ request.addValue($1, forHTTPHeaderField: $0) })
                
                let task = URLSession.shared.dataTask(with: request) { data, response, error in
                    if error != nil {
                        observer.onNext(.failure(.connection))
                        observer.onCompleted()
                    }
                    
                    if let response = response as? HTTPURLResponse {
                        guard let data = data else {
                            observer.onNext(.failure(.data))
                            observer.onCompleted()
                            return
                        }
                        
                        switch response.statusCode {
                        case 200..<300:
                            do {
                                let decodeObject = try JSONDecoder().decode(T.self, from: data)
                                observer.onNext(.success(decodeObject))
                            } catch {
                                observer.onNext(.failure(.decoding))
                            }
                            observer.onCompleted()
                            
                        case 400..<500:
                            observer.onNext(.failure(.badRequest))
                            observer.onCompleted()
                            
                        case 500:
                            observer.onNext(.failure(.internalError))
                            observer.onCompleted()

                        default:
                            observer.onNext(.failure(.unknown))
                            observer.onCompleted()
                        }
                    }
                }

                task.resume()
                return Disposables.create {
                    task.cancel()
                }
            }
            else {
                observer.onNext(.failure(.url))
                observer.onCompleted()
                return Disposables.create()
            }
        }
    }
}
