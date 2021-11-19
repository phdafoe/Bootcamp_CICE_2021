//
//  MoviesInteractor.swift
//  AppTmdbCice
//
//  Created by Andres Felipe Ocampo Eljaiek on 12/11/21.
//

import Foundation

// Input
protocol MoviesInteractorInputProtocol: BaseInteractorInputProtocol {
    func fetchDataNowPlayingInteractor()
    func fetchDataPopularInteractor()
    func fetchDataTopRatedInteractor()
    func fetchDataUpComingInteractor()
}

// Output
protocol MoviesProviderOutputProtocol: BaseProviderOutputProtocol {
    func setInfoNowPlaying(completionData: Result<[ResultNowPlaying]?, NetworkingError>)
    func setInfoPopular(completionData: Result<[ResultNowPlaying]?, NetworkingError>)
    func setInfoTopRated(completionData: Result<[ResultNowPlaying]?, NetworkingError>)
    func setInfoUpComing(completionData: Result<[ResultNowPlaying]?, NetworkingError>)
}

final class MoviesInteractor: BaseInteractor {
    
    weak var viewModel: MoviesInteractorOutputProtocol? {
        super.baseViewModel as? MoviesInteractorOutputProtocol
    }
    var provider: MoviesProviderInputProtocol? {
        super.baseProvider as? MoviesProviderInputProtocol
    }
    
    func transformDataResultNowPlayingToMoviesShowsModel(data: [ResultNowPlaying]?) -> [MoviesShowsModel]? {
        var arrayMoviesShowsModel: [MoviesShowsModel] = []
        if let dataDes = data {
            for index in 0..<dataDes.count {
                let object = MoviesShowsModel(id: dataDes[index].id,
                                              backdropPath: dataDes[index].backdropPath,
                                              posterPath: dataDes[index].posterPath,
                                              name: dataDes[index].originalTitle)
                arrayMoviesShowsModel.append(object)
            }
        }
        return arrayMoviesShowsModel
    }
}

// extension Input
extension MoviesInteractor: MoviesInteractorInputProtocol {
    
    func fetchDataNowPlayingInteractor() {
        self.provider?.fetchDataNowPlayingProvider()
    }
    
    func fetchDataPopularInteractor() {
        self.provider?.fetchDataPopularProvider()
    }
    
    func fetchDataTopRatedInteractor() {
        self.provider?.fetchDataTopRatedProvider()
    }
    
    func fetchDataUpComingInteractor() {
        self.provider?.fetchDataUpComingProvider()
    }
    
}

// extension Output
extension MoviesInteractor: MoviesProviderOutputProtocol {
    func setInfoNowPlaying(completionData: Result<[ResultNowPlaying]?, NetworkingError>) {
        switch completionData{
        case .success(let data):
            self.viewModel?.setInfoNowPlayingViewModel(data: self.transformDataResultNowPlayingToMoviesShowsModel(data: data))
        case .failure(let error):
            debugPrint(error)
        }
    }
    
    func setInfoPopular(completionData: Result<[ResultNowPlaying]?, NetworkingError>) {
        switch completionData{
        case .success(let data):
            self.viewModel?.setInfoPopularViewModel(data: self.transformDataResultNowPlayingToMoviesShowsModel(data: data))
        case .failure(let error):
            debugPrint(error)
        }
    }
    
    func setInfoTopRated(completionData: Result<[ResultNowPlaying]?, NetworkingError>) {
        switch completionData{
        case .success(let data):
            self.viewModel?.setInfoTopRatedViewModel(data: self.transformDataResultNowPlayingToMoviesShowsModel(data: data))
        case .failure(let error):
            debugPrint(error)
        }
    }
    
    func setInfoUpComing(completionData: Result<[ResultNowPlaying]?, NetworkingError>) {
        switch completionData{
        case .success(let data):
            self.viewModel?.setInfoUpComingViewModel(data: self.transformDataResultNowPlayingToMoviesShowsModel(data: data))
        case .failure(let error):
            debugPrint(error)
        }
    }
}
