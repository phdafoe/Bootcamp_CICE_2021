//
//  ShowsViewModel.swift
//  AppTmdbCice
//
//  Created by Andres Felipe Ocampo Eljaiek on 13/11/21.
//

import Foundation

// Output - Interactor
protocol ShowsInteractorOutputProtocol: BaseInteractorOutputProtocol {
    func setInfoTvAiringTodayViewModel(data: [ResultShows]?)
    func setInfoTvOnTheAirViewModel(data: [ResultShows]?)
    func setInfoTvPopularViewModel(data: [ResultShows]?)
    func setInfoTvTopRatedViewModel(data: [ResultShows]?)
}

final class ShowsViewModel: BaseViewModel, ObservableObject {
    
    @Published var arrayTvAiringToday: [ResultShows] = []
    @Published var arrayTvOnTheAir: [ResultShows] = []
    @Published var arrayTvPopular: [ResultShows] = []
    @Published var arrayTvTopRated: [ResultShows] = []
    
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
    func setInfoTvAiringTodayViewModel(data: [ResultShows]?) {
        self.arrayTvAiringToday.removeAll()
        self.arrayTvAiringToday = data ?? []
    }
    
    func setInfoTvOnTheAirViewModel(data: [ResultShows]?) {
        self.arrayTvOnTheAir.removeAll()
        self.arrayTvOnTheAir = data ?? []
    }
    
    func setInfoTvPopularViewModel(data: [ResultShows]?) {
        self.arrayTvPopular.removeAll()
        self.arrayTvPopular = data ?? []
    }
    
    func setInfoTvTopRatedViewModel(data: [ResultShows]?) {
        self.arrayTvTopRated.removeAll()
        self.arrayTvTopRated = data ?? []
    }
}
