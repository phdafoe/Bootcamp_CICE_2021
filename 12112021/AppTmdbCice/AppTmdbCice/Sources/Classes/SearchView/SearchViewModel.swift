//
//  Created on 3/12/21.
// Search.swift - Very brief description
//


import Foundation
import Combine

// Mark: - Output -> Interactor
protocol SearchInteractorOutputProtocol: BaseInteractorOutputProtocol {
    func setInfoSearchedMovieViewModel(data: [MoviesShowsModel]?)
}

final class SearchViewModel: BaseViewModel, ObservableObject {

    // MARK: VIP Dependencies
    var interactor: SearchInteractorInputProtocol? {
        super.baseInteractor as? SearchInteractorInputProtocol
    }
    
    
    @Published var query = ""
    @Published var arrayMovies: [MoviesShowsModel]? = []
    private var subscriptionToken: AnyCancellable?
    
    func startObserve() {
        guard subscriptionToken == nil else {
            return
        }
        
        self.subscriptionToken = self.$query.map { [weak self] text in
            self?.arrayMovies = nil
            if text.count > 4{
                return text
            }
            return ""
        }
        .throttle(for: 1, scheduler: DispatchQueue.main, latest: true)
        .sink(receiveValue: { [weak self] in
            self?.search(query: $0)
        })
    }
    
    func search(query: String) {
        self.arrayMovies?.removeAll()
        guard !query.isEmpty else {
            return
        }
        self.interactor?.fetchDataSearchMovieInteractor(query: query)
    }
    
    
}

// Mark: - extension Output ->  Interactor
extension SearchViewModel: SearchInteractorOutputProtocol {
    func setInfoSearchedMovieViewModel(data: [MoviesShowsModel]?){
        self.arrayMovies?.removeAll()
        self.arrayMovies = data ?? []
    }
}
