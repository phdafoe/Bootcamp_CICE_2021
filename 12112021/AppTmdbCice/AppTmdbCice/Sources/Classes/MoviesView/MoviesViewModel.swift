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
}

final class MoviesViewModel: BaseViewModel, ObservableObject {
    
    @Published var arrayMoviesNowPlaying: [ResultNowPlaying] = []
    @Published var arrayMoviesPopular: [ResultNowPlaying] = []
  
    var interactor: MoviesInteractorInputProtocol? {
        super.baseInteractor as? MoviesInteractorInputProtocol
    }
    
    func fetchData() {
        self.interactor?.fetchDataNowPlayingInteractor()
        self.interactor?.fetchDataPopularInteractor()
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
}
