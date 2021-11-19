//
//  ShowsViewModel.swift
//  AppTmdbCice
//
//  Created by Andres Felipe Ocampo Eljaiek on 13/11/21.
//

import Foundation

// Output - Interactor
protocol ShowsInteractorOutputProtocol: BaseInteractorOutputProtocol {
    func setInfoTvAiringTodayViewModel(data: [MoviesShowsModel]?)
    func setInfoTvOnTheAirViewModel(data: [MoviesShowsModel]?)
    func setInfoTvPopularViewModel(data: [MoviesShowsModel]?)
    func setInfoTvTopRatedViewModel(data: [MoviesShowsModel]?)
}

final class ShowsViewModel: BaseViewModel, ObservableObject {
    
    @Published var arrayTvAiringToday: [MoviesShowsModel] = []
    @Published var arrayTvOnTheAir: [MoviesShowsModel] = []
    @Published var arrayTvPopular: [MoviesShowsModel] = []
    @Published var arrayTvTopRated: [MoviesShowsModel] = []
    
    var interactor: ShowsInteractorInputProtocol? {
        super.baseInteractor as? ShowsInteractorInputProtocol
    }
    
    func fetchTvShowsData() {
        self.interactor?.fetchDataTvAiringTodayInteractor()
        self.interactor?.fetchDataTvOnTheAirInteractor()
        self.interactor?.fetchDataTvPopularInteractor()
        self.interactor?.fetcDataTvTopRatedInteractor()
    }
}

// extension Output - Interactor
extension ShowsViewModel: ShowsInteractorOutputProtocol {
    func setInfoTvAiringTodayViewModel(data: [MoviesShowsModel]?) {
        self.arrayTvAiringToday.removeAll()
        self.arrayTvAiringToday = data ?? []
    }
    
    func setInfoTvOnTheAirViewModel(data: [MoviesShowsModel]?) {
        self.arrayTvOnTheAir.removeAll()
        self.arrayTvOnTheAir = data ?? []
    }
    
    func setInfoTvPopularViewModel(data: [MoviesShowsModel]?) {
        self.arrayTvPopular.removeAll()
        self.arrayTvPopular = data ?? []
    }
    
    func setInfoTvTopRatedViewModel(data: [MoviesShowsModel]?) {
        self.arrayTvTopRated.removeAll()
        self.arrayTvTopRated = data ?? []
    }
}
