//
//  MoviesProvider.swift
//  AppTmdbCice
//
//  Created by Andres Felipe Ocampo Eljaiek on 12/11/21.
//

import Foundation
import Combine

// Input
protocol MoviesProviderInputProtocol: BaseProviderInputProtocol {
    func fetchDataNowPlayingProvider()
    func fetchDataPopularProvider()
}

final class MoviesProvider: BaseProvider {
    
    weak var interactor: MoviesProviderOutputProtocol? {
        super.baseInteractor as? MoviesProviderOutputProtocol
    }
    
    let networkService: NetworkServiceProtocol = NetworkService()
    var cancellable: Set<AnyCancellable> = []
}

// extension Input
extension MoviesProvider: MoviesProviderInputProtocol {
    
    func fetchDataNowPlayingProvider() {
        
        let request = RequestDTO(params: nil,
                                 arrayParams: nil,
                                 method: .get,
                                 urlContext: .webService,
                                 endpoint: URLEndpoint.endpointMoviesNowPlaying)
        
        self.networkService.requestGeneric(request: request,
                                           entityClass: MoviesNowPlayingServerModel.self)
            .sink { completion in
                switch completion{
                case .finished: break
                case .failure(let error):
                    self.interactor?.setInfoNowPlaying(completionData: .failure(error))
                }
            } receiveValue: { resultData in
                self.interactor?.setInfoNowPlaying(completionData: .success(resultData.results))
            }
            .store(in: &cancellable)
    }
    
    func fetchDataPopularProvider() {
        let request = RequestDTO(params: nil,
                                 arrayParams: nil,
                                 method: .get,
                                 urlContext: .webService,
                                 endpoint: URLEndpoint.endpointMoviesPopular)
        
        self.networkService.requestGeneric(request: request,
                                           entityClass: MoviesNowPlayingServerModel.self)
            .sink { completion in
                switch completion{
                case .finished: break
                case .failure(let error):
                    self.interactor?.setInfoPopular(completionData: .failure(error))
                }
            } receiveValue: { resultData in
                self.interactor?.setInfoPopular(completionData: .success(resultData.results))
            }
            .store(in: &cancellable)
    }
    
    
    
    
}
