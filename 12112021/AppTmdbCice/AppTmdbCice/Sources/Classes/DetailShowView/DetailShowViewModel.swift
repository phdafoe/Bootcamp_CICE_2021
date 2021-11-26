//
//  Created on 20/11/21.
// DetailShow.swift - Very brief description
//


import Foundation

// Mark: - Output -> Interactor
protocol DetailShowInteractorOutputProtocol: BaseInteractorOutputProtocol {
    func setInfoDetailShowViewModel(data: DetailShowModel?)
    func setInfoShowRecommendationViewModel(data: [MoviesShowsModel]?)
}

final class DetailShowViewModel: BaseViewModel, ObservableObject {

    // MARK: VIP Dependencies
    var interactor: DetailShowInteractorInputProtocol? {
        super.baseInteractor as? DetailShowInteractorInputProtocol
    }
    
    @Published var model: DetailShowModel?
    @Published var arrayShowsRecommendation: [MoviesShowsModel] = []
    
    func fetchDataDetailShowModel() {
        self.interactor?.fetchDataDetailShowModelInteractor()
        self.interactor?.fetchDataShowRecommendationModelInteractor()
    }
    
}

// Mark: - extension Output ->  Interactor
extension DetailShowViewModel: DetailShowInteractorOutputProtocol {
    
    func setInfoDetailShowViewModel(data: DetailShowModel?) {
        self.model = data
    }
    
    func setInfoShowRecommendationViewModel(data: [MoviesShowsModel]?) {
        self.arrayShowsRecommendation.removeAll()
        self.arrayShowsRecommendation = data ?? []
    }
    
    
    

}
