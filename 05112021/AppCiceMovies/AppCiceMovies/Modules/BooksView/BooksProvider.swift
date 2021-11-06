//
//  BooksProvider.swift
//  AppCiceMovies
//
//  Created by Andres Felipe Ocampo Eljaiek on 6/11/21.
//

import Foundation
import Combine

protocol BooksProviderProtocol {
    func fetchBooksAppleProvider(completionHandler: @escaping(Result<AppleRssServerModel, NetworkingError>) -> ())
}

final class BooksProvider {
    
    var cancellable: Set<AnyCancellable> = []
    let networkService: NetworkServiceProtocol = NetworkService()
    
}

extension BooksProvider: BooksProviderProtocol {
    
    func fetchBooksAppleProvider(completionHandler: @escaping(Result<AppleRssServerModel, NetworkingError>) -> ()) {
        let request = RequestDTO(params: nil,
                                 arrayParams: nil,
                                 method: .get,
                                 urlContext: .webService,
                                 endpoint: URLEndpoint.endpointBooks)
        
        self.networkService.requestGeneric(request: request,
                                           entityClass: AppleRssServerModel.self)
            .sink { [weak self] (completionTask) in
                guard self != nil else { return }
                switch completionTask {
                case .finished: break
                case .failure(let error):
                    completionHandler(.failure(error))
                }
            } receiveValue: { [weak self] resultData in
                guard self != nil else { return }
                completionHandler(.success(resultData))
            }
            .store(in: &cancellable)
    }
    
    
}
