//
//  MoviesViewModel.swift
//  AppTmdbCice
//
//  Created by Andres Felipe Ocampo Eljaiek on 12/11/21.
//

import Foundation

// Output
protocol MoviesInteractorOutputProtocol: BaseInteractorOutputProtocol {
    func setInfoNowPlayingViewModel(data: [ResultNowPlaying]?)
    func setInfoPopularViewModel(data: [ResultNowPlaying]?)
    func setInfoTopRatedViewModel(data: [ResultNowPlaying]?)
    func setInfoUpComingViewModel(data: [ResultNowPlaying]?)
}

final class MoviesViewModel: BaseViewModel, ObservableObject {
    
    @Published var arrayMoviesNowPlaying: [ResultNowPlaying] = []
    @Published var arrayMoviesPopular: [ResultNowPlaying] = []
    @Published var arrayMoviesTopRated: [ResultNowPlaying] = []
    @Published var arrayMoviesUpComing: [ResultNowPlaying] = []
  
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
    
    func setInfoNowPlayingViewModel(data: [ResultNowPlaying]?) {
        self.arrayMoviesNowPlaying.removeAll()
        self.arrayMoviesNowPlaying = data ?? []
    }
    
    func setInfoPopularViewModel(data: [ResultNowPlaying]?) {
        self.arrayMoviesPopular.removeAll()
        self.arrayMoviesPopular = data ?? []
    }
    
    func setInfoTopRatedViewModel(data: [ResultNowPlaying]?) {
        self.arrayMoviesTopRated.removeAll()
        self.arrayMoviesTopRated = data ?? []
    }
    
    func setInfoUpComingViewModel(data: [ResultNowPlaying]?) {
        self.arrayMoviesUpComing.removeAll()
        self.arrayMoviesUpComing = data ?? []
    }
}
