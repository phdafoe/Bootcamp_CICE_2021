//
//  Created on 20/11/21.
// DetailShow.swift - Very brief description
//


import Foundation
import Combine

// Mark: - Input Provider
protocol DetailShowProviderInputProtocol: BaseProviderInputProtocol {
    
    func fetchDataDetailShowModelProvider(isMock: Bool)
    func fetchDataShowRecommendationModelProvider(isMock: Bool)
    
}

final class DetailShowProvider: BaseProvider {

    // MARK: - VIP Dependences
    weak var interactor: DetailShowProviderOutputProtocol? {
        super.baseInteractor as? DetailShowProviderOutputProtocol
    }
    
    let networkService: NetworkServiceProtocol = NetworkService()
    var cancellable: Set<AnyCancellable> = []
    
    var showObject: MoviesShowsModel?
    let supportParameters = "videos,credits"
    
}

// Mark: - extension -> Input Provider
extension DetailShowProvider: DetailShowProviderInputProtocol {
    
    func fetchDataDetailShowModelProvider(isMock: Bool) {
        if !isMock{
            let showId = "\(showObject?.id ?? 0)"
            let parameters: [CVarArg] = [showId, supportParameters]
            let finalEndpoint = String(format: URLEndpoint.endpointDetailShow, arguments: parameters)
            let request = RequestDTO(params: nil,
                                     arrayParams: nil,
                                     method: .get,
                                     urlContext: .webService,
                                     endpoint: finalEndpoint)
            
            self.networkService.requestGeneric(request: request,
                                               entityClass: DetailShowModel.self)
                .sink { completion in
                    switch completion{
                    case .finished: break
                    case .failure(let error):
                            debugPrint(error)
                        self.interactor?.setInfoDetailShow(completionData: .failure(error))
                    }
                } receiveValue: { resultData in
                    self.interactor?.setInfoDetailShow(completionData: .success(resultData))
                }
                .store(in: &cancellable)
        } else {
            let resultData = DetailShowModel.stubbedDetailShowModel
            self.interactor?.setInfoDetailShow(completionData: .success(resultData))
        }
    }
    
    func fetchDataShowRecommendationModelProvider(isMock: Bool) {
        if !isMock{
            let showId = "\(showObject?.id ?? 0)"
            let parameters: [CVarArg] = [showId, supportParameters]
            let finalEndpoint = String(format: URLEndpoint.endpointShowsRecommendation, arguments: parameters)
            let request = RequestDTO(params: nil,
                                     arrayParams: nil,
                                     method: .get,
                                     urlContext: .webService,
                                     endpoint: finalEndpoint)
            
            self.networkService.requestGeneric(request: request,
                                               entityClass: ShowsModel.self)
                .sink { completion in
                    switch completion{
                    case .finished: break
                    case .failure(let error):
                            debugPrint(error)
                        self.interactor?.setInfoShowRecommendation(completionData: .failure(error))
                    }
                } receiveValue: { resultData in
                    self.interactor?.setInfoShowRecommendation(completionData: .success(resultData.results))
                }
                .store(in: &cancellable)
        } else {
            
        }
    }
    
    
}


