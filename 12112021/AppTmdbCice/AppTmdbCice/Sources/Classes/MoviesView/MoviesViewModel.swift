//
//  MoviesViewModel.swift
//  AppTmdbCice
//
//  Created by Andres Felipe Ocampo Eljaiek on 12/11/21.
//

import Foundation

// Output
protocol MoviesInteractorOutputProtocol: BaseInteractorOutputProtocol {
    func setInfoNowPlayingViewModel(data: [MoviesShowsModel]?)
    func setInfoPopularViewModel(data: [MoviesShowsModel]?)
    func setInfoTopRatedViewModel(data: [MoviesShowsModel]?)
    func setInfoUpComingViewModel(data: [MoviesShowsModel]?)
}

final class MoviesViewModel: BaseViewModel, ObservableObject {
    
    @Published var arrayMoviesNowPlaying: [MoviesShowsModel] = []
    @Published var arrayMoviesPopular: [MoviesShowsModel] = []
    @Published var arrayMoviesTopRated: [MoviesShowsModel] = []
    @Published var arrayMoviesUpComing: [MoviesShowsModel] = []
  
    var interactor: MoviesInteractorInputProtocol? {
        super.baseInteractor as? MoviesInteractorInputProtocol
    }
    
    func fetchData() {
        self.interactor?.fetchDataNowPlayingInteractor()
        self.interactor?.fetchDataPopularInteractor()
        self.interactor?.fetchDataTopRatedInteractor()
        self.interactor?.fetchDataUpComingInteractor()
    }
  
}

// extension Output
extension MoviesViewModel: MoviesInteractorOutputProtocol {
    
    func setInfoNowPlayingViewModel(data: [MoviesShowsModel]?) {
        self.arrayMoviesNowPlaying.removeAll()
        self.arrayMoviesNowPlaying = data ?? []
    }
    
    func setInfoPopularViewModel(data: [MoviesShowsModel]?) {
        self.arrayMoviesPopular.removeAll()
        self.arrayMoviesPopular = data ?? []
    }
    
    func setInfoTopRatedViewModel(data: [MoviesShowsModel]?) {
        self.arrayMoviesTopRated.removeAll()
        self.arrayMoviesTopRated = data ?? []
    }
    
    func setInfoUpComingViewModel(data: [MoviesShowsModel]?) {
        self.arrayMoviesUpComing.removeAll()
        self.arrayMoviesUpComing = data ?? []
    }
}
