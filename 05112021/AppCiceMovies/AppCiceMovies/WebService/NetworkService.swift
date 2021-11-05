//
//  NetworkService.swift
//  AppCiceMovies
//
//  Created by Andres Felipe Ocampo Eljaiek on 5/11/21.
//

import Foundation
import Combine

protocol NetworkServiceProtocol {
    func requestGeneric<M: Decodable>(request: RequestDTO, entityClass: M.Type) -> AnyPublisher<M, NetworkingError>
}


final class NetworkService: NetworkServiceProtocol {
    
    func requestGeneric<M>(request: RequestDTO, entityClass: M.Type) -> AnyPublisher<M, NetworkingError> where M : Decodable {
        
        let baseUrl = URLEndpoint.getUrlBase(with: request.urlContext)
        let endpoint = "\(baseUrl)\(request.endpoint)"
        guard let urlDes = URL(string: endpoint) else {
            return Fail(error: NetworkingError(status: .badURL)).eraseToAnyPublisher()
        }
        let urlRequest = URLRequest(url: urlDes)
        
        return URLSession
            .shared
            .dataTaskPublisher(for: urlRequest)
            .mapError { (error) -> NetworkingError in
                NetworkingError(error: error)
            }
            .flatMap { (data, response) -> AnyPublisher<M, NetworkingError> in
                guard let httpResponse = response as? HTTPURLResponse else {
                    return Fail(error: NetworkingError(status: .badRequest)).eraseToAnyPublisher()
                }
                if (200...299).contains(httpResponse.statusCode) {
                    return Just(data)
                        .decode(type: M.self, decoder: JSONDecoder())
                        .mapError { (error) in
                            NetworkingError(status: .accepted)
                        }
                        .eraseToAnyPublisher()
                } else {
                    let error = NetworkingError(errorCode: httpResponse.statusCode)
                    return Fail(error: NetworkingError(error: error)).eraseToAnyPublisher()
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
