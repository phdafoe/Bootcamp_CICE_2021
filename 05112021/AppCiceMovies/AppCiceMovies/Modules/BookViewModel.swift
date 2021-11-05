//
//  BookViewModel.swift
//  AppCiceMovies
//
//  Created by Andres Felipe Ocampo Eljaiek on 5/11/21.
//

import Foundation
import Combine


final class BookViewModel: ObservableObject {
    
    @Published var arrayBooks: [ResultRss] = []
    var cancellable: Set<AnyCancellable> = []
    
    let networkService: NetworkServiceProtocol = NetworkService()
    
    func fetchBooksApple() {
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
                    debugPrint(error)
                }
            } receiveValue: { [weak self] resultData in
                guard self != nil else { return }
                self?.arrayBooks = resultData.feed?.results ?? []
            }
            .store(in: &cancellable)

    }
    
}
