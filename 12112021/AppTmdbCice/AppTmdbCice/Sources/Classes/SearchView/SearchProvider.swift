//
//  Created on 3/12/21.
// Search.swift - Very brief description
//


import Foundation
import Combine

// Mark: - Input Provider
protocol SearchProviderInputProtocol: BaseProviderInputProtocol {
    func fetchDataSearchMovieProvider(query: String)
}

final class SearchProvider: BaseProvider {

    // MARK: - VIP Dependences
    weak var interactor: SearchProviderOutputProtocol? {
        super.baseInteractor as? SearchProviderOutputProtocol
    }
    
    let networkService: NetworkServiceProtocol = NetworkService()
    var cancellable: Set<AnyCancellable> = []
    
}

// Mark: - extension -> Input Provider
extension SearchProvider: SearchProviderInputProtocol {
    func fetchDataSearchMovieProvider(query: String) {
        
        let parameters: [CVarArg] = [query]
        let finalEndpoint = String(format: URLEndpoint.endpointSearchMovie, arguments: parameters)
        
        let request = RequestDTO(params: nil,
                                 arrayParams: nil,
                                 method: .get,
                                 urlContext: .webService,
                                 endpoint: finalEndpoint)
        
        self.networkService.requestGeneric(request: request,
                                           entityClass: MoviesModel.self)
            .sink { completion in
                switch completion{
                case .finished: break
                case .failure(let error):
                    self.interactor?.setInfoSearchedMovie(completionData: .failure(error))
                }
            } receiveValue: { resultData in
                self.interactor?.setInfoSearchedMovie(completionData: .success(resultData.results))
            }
            .store(in: &cancellable)
        
    }
}


