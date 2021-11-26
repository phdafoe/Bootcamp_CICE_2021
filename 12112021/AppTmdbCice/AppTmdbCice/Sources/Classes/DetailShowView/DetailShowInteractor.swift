//
//  Created on 20/11/21.
// DetailShow.swift - Very brief description
//

import Foundation

// Mark: - Input Interactor
protocol DetailShowInteractorInputProtocol: BaseInteractorInputProtocol {
    func fetchDataDetailShowModelInteractor()
    func fetchDataShowRecommendationModelInteractor()
    
}

// Mark: - Output -> Provider
protocol DetailShowProviderOutputProtocol: BaseProviderOutputProtocol {
    func setInfoDetailShow(completionData: Result<DetailShowModel?, NetworkingError>)
    func setInfoShowRecommendation(completionData: Result<[ResultShows]?, NetworkingError>)
}

final class DetailShowInteractor: BaseInteractor {

    // MARK: VIP Dependencies
    weak var viewModel: DetailShowInteractorOutputProtocol? {
        super.baseViewModel as? DetailShowInteractorOutputProtocol
    }
    var provider: DetailShowProviderInputProtocol? {
        super.baseProvider as? DetailShowProviderInputProtocol
    }
    
    func transformDataResultShowsToMoviesShowsModel(data: [ResultShows]?) -> [MoviesShowsModel]? {
        var arrayMoviesShowsModel: [MoviesShowsModel] = []
        if let dataDes = data {
            for index in 0..<dataDes.count {
                let object = MoviesShowsModel(id: dataDes[index].id,
                                              backdropPath: dataDes[index].backdropPath,
                                              posterPath: dataDes[index].posterPath,
                                              name: dataDes[index].name)
                arrayMoviesShowsModel.append(object)
            }
        }
        return arrayMoviesShowsModel
    }

}

// Mark: - extension -> Input Interactor
extension DetailShowInteractor: DetailShowInteractorInputProtocol {
    
    func fetchDataDetailShowModelInteractor() {
        self.provider?.fetchDataDetailShowModelProvider(isMock: false)
    }
    
    func fetchDataShowRecommendationModelInteractor() {
        self.provider?.fetchDataShowRecommendationModelProvider(isMock: false)
    }
    

}

// Mark: - extension Output -> Provider
extension DetailShowInteractor: DetailShowProviderOutputProtocol{
    func setInfoDetailShow(completionData: Result<DetailShowModel?, NetworkingError>) {
        switch completionData{
        case .success(let data):
            self.viewModel?.setInfoDetailShowViewModel(data: data)
        case .failure(let error):
            debugPrint(error)
        }
    }
    
    func setInfoShowRecommendation(completionData: Result<[ResultShows]?, NetworkingError>) {
        switch completionData{
        case .success(let data):
            self.viewModel?.setInfoShowRecommendationViewModel(data: self.transformDataResultShowsToMoviesShowsModel(data: data))
        case .failure(let error):
            debugPrint(error)
        }
    }
    
    
}
