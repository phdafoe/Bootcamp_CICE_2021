//
//  DetailMovieInteractor.swift
//  AppTmdbCice
//
//  Created by Andres Felipe Ocampo Eljaiek on 13/11/21.
//

import Foundation

// Input
protocol DetailMovieInteractorInputProtocol: BaseInteractorInputProtocol {
    func fetchDataDetailMovieModelInteractor()
    func fetchDataMovieRecommendationsInteractor()
}

// Ouput - Provider
protocol DetailMovieProviderOutputProtocol: BaseProviderOutputProtocol {
    func setInfoDetailMovie(completionData: Result<DetailMovieModel?, NetworkingError>)
    func setInfoMovieRecommended(completionData: Result<[ResultNowPlaying]?, NetworkingError>)
}

final class DetailMovieInteractor: BaseInteractor {
    weak var viewModel: DetailMovieInteractorOutputProtocol? {
        super.baseViewModel as? DetailMovieInteractorOutputProtocol
    }
    var provider: DetailMovieProviderInputProtocol? {
        super.baseProvider as? DetailMovieProviderInputProtocol
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
extension DetailMovieInteractor: DetailMovieInteractorInputProtocol {
    func fetchDataDetailMovieModelInteractor() {
        self.provider?.fetchDataDetailMovieWithParameters()
    }
    
    func fetchDataMovieRecommendationsInteractor() {
        self.provider?.fetchDataMovieRecommendationsProvider()
    }
}

// extension Output - Provider
extension DetailMovieInteractor: DetailMovieProviderOutputProtocol{
    

    func setInfoDetailMovie(completionData: Result<DetailMovieModel?, NetworkingError>) {
        switch completionData{
        case .success(let data):
            self.viewModel?.setInfoDetailMovieViewModel(data: data)
        case .failure(let error):
            debugPrint(error)
        }
    }
    
    func setInfoMovieRecommended(completionData: Result<[ResultNowPlaying]?, NetworkingError>) {
        switch completionData{
        case .success(let data):
            self.viewModel?.setInfoMovieRecommendedViewModel(data: self.transformDataResultNowPlayingToMoviesShowsModel(data: data))
        case .failure(let error):
            debugPrint(error)
        }
    }
    
    
}
