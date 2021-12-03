//
//  Created on 3/12/21.
// Search.swift - Very brief description
//

import Foundation

// Mark: - Input Interactor
protocol SearchInteractorInputProtocol: BaseInteractorInputProtocol {
    func fetchDataSearchMovieInteractor(query: String)
}

// Mark: - Output -> Provider
protocol SearchProviderOutputProtocol: BaseProviderOutputProtocol {
    func setInfoSearchedMovie(completionData: Result<[ResultNowPlaying]?, NetworkingError>)
}

final class SearchInteractor: BaseInteractor {

    // MARK: VIP Dependencies
    weak var viewModel: SearchInteractorOutputProtocol? {
        super.baseViewModel as? SearchInteractorOutputProtocol
    }
    var provider: SearchProviderInputProtocol? {
        super.baseProvider as? SearchProviderInputProtocol
    }
    
    func transformDataResultNowPlayingToSearchedMovieModel(data: [ResultNowPlaying]?) -> [MoviesShowsModel]? {
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

// Mark: - extension -> Input Interactor
extension SearchInteractor: SearchInteractorInputProtocol {

    func fetchDataSearchMovieInteractor(query: String) {
        self.provider?.fetchDataSearchMovieProvider(query: query)
    }
}

// Mark: - extension Output -> Provider
extension SearchInteractor: SearchProviderOutputProtocol{
    
    func setInfoSearchedMovie(completionData: Result<[ResultNowPlaying]?, NetworkingError>) {
        switch completionData{
        case .success(let data):
            self.viewModel?.setInfoSearchedMovieViewModel(data: self.transformDataResultNowPlayingToSearchedMovieModel(data: data))
        case .failure(let error):
            debugPrint(error)
        }
    }
}
