//
//  ShowsInteractor.swift
//  AppTmdbCice
//
//  Created by Andres Felipe Ocampo Eljaiek on 13/11/21.
//

import Foundation

// Input
protocol ShowsInteractorInputProtocol: BaseInteractorInputProtocol {
    func fetchDataTvAiringTodayInteractor()
    func fetchDataTvOnTheAirInteractor()
    func fetchDataTvPopularInteractor()
    func fetcDataTvTopRatedInteractor()
}

// Output - Provider
protocol ShowsProviderOutputProtocol: BaseProviderOutputProtocol {
    func setInfoTvAiringToday(completionData: Result<[ResultShows]?, NetworkingError>)
    func setInfoTvOnTheAir(completionData: Result<[ResultShows]?, NetworkingError>)
    func setInfoTvPopular(completionData: Result<[ResultShows]?, NetworkingError>)
    func setInfoTvTopRated(completionData: Result<[ResultShows]?, NetworkingError>)
}

final class ShowsInteractor: BaseInteractor {
    
    weak var viewModel: ShowsInteractorOutputProtocol? {
        super.baseViewModel as? ShowsInteractorOutputProtocol
    }
    var provider: ShowsProviderInputProtocol? {
        super.baseProvider as? ShowsProviderInputProtocol
    }
}

// extension Input
extension ShowsInteractor: ShowsInteractorInputProtocol {
    func fetchDataTvAiringTodayInteractor() {
        self.provider?.fethDataTvAiringTodayProvider()
    }
    
    func fetchDataTvOnTheAirInteractor() {
        self.provider?.fetchDataTvOnTheAirProvider()
    }
    
    func fetchDataTvPopularInteractor() {
        self.provider?.fetchDataTvPopularProvider()
    }
    
    func fetcDataTvTopRatedInteractor() {
        self.provider?.fetchDataTvTopRatedProvider()
    }
}

// extension Output - Provider
extension ShowsInteractor: ShowsProviderOutputProtocol {
    func setInfoTvAiringToday(completionData: Result<[ResultShows]?, NetworkingError>) {
        switch completionData{
        case .success(let data):
            self.viewModel?.setInfoTvAiringTodayViewModel(data: data)
        case .failure(let error):
            debugPrint(error)
        }
    }
    
    func setInfoTvOnTheAir(completionData: Result<[ResultShows]?, NetworkingError>) {
        switch completionData{
        case .success(let data):
            self.viewModel?.setInfoTvOnTheAirViewModel(data: data)
        case .failure(let error):
            debugPrint(error)
        }
    }
    
    func setInfoTvPopular(completionData: Result<[ResultShows]?, NetworkingError>) {
        switch completionData{
        case .success(let data):
            self.viewModel?.setInfoTvPopularViewModel(data: data)
        case .failure(let error):
            debugPrint(error)
        }
    }
    
    func setInfoTvTopRated(completionData: Result<[ResultShows]?, NetworkingError>) {
        switch completionData{
        case .success(let data):
            self.viewModel?.setInfoTvTopRatedViewModel(data: data)
        case .failure(let error):
            debugPrint(error)
        }
    }
}
