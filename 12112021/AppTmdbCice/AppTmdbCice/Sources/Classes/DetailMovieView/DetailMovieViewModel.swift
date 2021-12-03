//
//  DetailMovieViewModel.swift
//  AppTmdbCice
//
//  Created by Andres Felipe Ocampo Eljaiek on 13/11/21.
//

import Foundation

// Output - Interactor
protocol DetailMovieInteractorOutputProtocol: BaseInteractorOutputProtocol{
    func setInfoDetailMovieViewModel(data: DetailMovieModel?)
    func setInfoMovieRecommendedViewModel(data: [MoviesShowsModel]?)
}

final class DetailMovieViewModel: BaseViewModel, ObservableObject {
    
    var interactor: DetailMovieInteractorInputProtocol? {
        super.baseInteractor as? DetailMovieInteractorInputProtocol
    }
    
    @Published var model: DetailMovieModel?
    @Published var arrayMoviesRecommended: [MoviesShowsModel] = []
    
    func fetchDataDetailMovieModel() {
        self.state = .loading
        self.interactor?.fetchDataDetailMovieModelInteractor()
        self.interactor?.fetchDataMovieRecommendationsInteractor()
    }
}

// extension Output - Interactor
extension DetailMovieViewModel: DetailMovieInteractorOutputProtocol {

    func setInfoDetailMovieViewModel(data: DetailMovieModel?) {
        self.model = data
        self.state = .ok
    }
    
    func setInfoMovieRecommendedViewModel(data: [MoviesShowsModel]?) {
        self.arrayMoviesRecommended.removeAll()
        self.arrayMoviesRecommended = data ?? []
        self.state = .ok
    }
  
}
