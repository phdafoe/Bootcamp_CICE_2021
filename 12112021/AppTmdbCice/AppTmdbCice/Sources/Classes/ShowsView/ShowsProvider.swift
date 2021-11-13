//
//  ShowsProvider.swift
//  AppTmdbCice
//
//  Created by Andres Felipe Ocampo Eljaiek on 13/11/21.
//

import Foundation
import Combine

// Input
protocol ShowsProviderInputProtocol: BaseProviderInputProtocol {
    func fethDataTvAiringTodayProvider()
    func fetchDataTvOnTheAirProvider()
    func fetchDataTvPopularProvider()
    func fetchDataTvTopRatedProvider()
}

final class ShowsProvider: BaseProvider {
    
    weak var interactor: ShowsProviderOutputProtocol? {
        super.baseInteractor as? ShowsProviderOutputProtocol
    }
    
    let networkService: NetworkServiceProtocol = NetworkService()
    var cancellable: Set<AnyCancellable> = []
}

// extension Input
extension ShowsProvider: ShowsProviderInputProtocol{
    func fethDataTvAiringTodayProvider() {
        let request = RequestDTO(params: nil,
                                 arrayParams: nil,
                                 method: .get,
                                 urlContext: .webService,
                                 endpoint: URLEndpoint.endpointTvAiringToday)
        
        self.networkService.requestGeneric(request: request,
                                           entityClass: ShowsModel.self)
            .sink { completion in
                switch completion{
                case .finished: break
                case .failure(let error):
                    self.interactor?.setInfoTvAiringToday(completionData: .failure(error))
                }
            } receiveValue: { resultData in
                self.interactor?.setInfoTvAiringToday(completionData: .success(resultData.results))
            }
            .store(in: &cancellable)
    }
    
    func fetchDataTvOnTheAirProvider() {
        let request = RequestDTO(params: nil,
                                 arrayParams: nil,
                                 method: .get,
                                 urlContext: .webService,
                                 endpoint: URLEndpoint.endpointTvOnTheAir)
        
        self.networkService.requestGeneric(request: request,
                                           entityClass: ShowsModel.self)
            .sink { completion in
                switch completion{
                case .finished: break
                case .failure(let error):
                    self.interactor?.setInfoTvOnTheAir(completionData: .failure(error))
                }
            } receiveValue: { resultData in
                self.interactor?.setInfoTvOnTheAir(completionData: .success(resultData.results))
            }
            .store(in: &cancellable)
    }
    
    func fetchDataTvPopularProvider() {
        let request = RequestDTO(params: nil,
                                 arrayParams: nil,
                                 method: .get,
                                 urlContext: .webService,
                                 endpoint: URLEndpoint.endpointTvPopular)
        
        self.networkService.requestGeneric(request: request,
                                           entityClass: ShowsModel.self)
            .sink { completion in
                switch completion{
                case .finished: break
                case .failure(let error):
                    self.interactor?.setInfoTvPopular(completionData: .failure(error))
                }
            } receiveValue: { resultData in
                self.interactor?.setInfoTvPopular(completionData: .success(resultData.results))
            }
            .store(in: &cancellable)
    }
    
    func fetchDataTvTopRatedProvider() {
        let request = RequestDTO(params: nil,
                                 arrayParams: nil,
                                 method: .get,
                                 urlContext: .webService,
                                 endpoint: URLEndpoint.endpointTvTopRated)
        
        self.networkService.requestGeneric(request: request,
                                           entityClass: ShowsModel.self)
            .sink { completion in
                switch completion{
                case .finished: break
                case .failure(let error):
                    self.interactor?.setInfoTvTopRated(completionData: .failure(error))
                }
            } receiveValue: { resultData in
                self.interactor?.setInfoTvTopRated(completionData: .success(resultData.results))
            }
            .store(in: &cancellable)
    }
}
