//
//  DetailMovieProvider.swift
//  AppTmdbCice
//
//  Created by Andres Felipe Ocampo Eljaiek on 13/11/21.
//

import Foundation
import Combine
import FirebaseFirestore

// Input
protocol DetailMovieProviderInputProtocol: BaseProviderInputProtocol {
    func fetchDataDetailMovieWithParameters()
    func fetchDataMovieRecommendationsProvider()
    func saveDataInFirebaseDBProvider(data: DetailMovieModel)
}

final class DetailMovieProvider: BaseProvider {
    
    weak var interactor: DetailMovieProviderOutputProtocol? {
        super.baseInteractor as? DetailMovieProviderOutputProtocol
    }
    
    let networkService: NetworkServiceProtocol = NetworkService()
    var cancellable: Set<AnyCancellable> = []
    
    var movieObject: MoviesShowsModel?
    let supportParameters = "videos,credits"
    private var dbFirebase = Firestore.firestore()
    
}

// extension Input
extension DetailMovieProvider: DetailMovieProviderInputProtocol {
    func fetchDataDetailMovieWithParameters() {
        let movieId = "\(movieObject?.id ?? 0)"
        let parameters: [CVarArg] = [movieId, supportParameters]
        let finalEndpoint = String(format: URLEndpoint.endpointDetailMovie, arguments: parameters)
        let request = RequestDTO(params: nil,
                                 arrayParams: nil,
                                 method: .get,
                                 urlContext: .webService,
                                 endpoint: finalEndpoint)
        
        self.networkService.requestGeneric(request: request,
                                           entityClass: DetailMovieModel.self)
            .sink { completion in
                switch completion{
                case .finished: break
                case .failure(let error):
                    self.interactor?.setInfoDetailMovie(completionData: .failure(error))
                }
            } receiveValue: { resultData in
                self.interactor?.setInfoDetailMovie(completionData: .success(resultData))
            }
            .store(in: &cancellable)
    }
    
    func fetchDataMovieRecommendationsProvider() {
        let movieId = "\(movieObject?.id ?? 0)"
        let parameters: [CVarArg] = [movieId]
        let finalEndpoint = String(format: URLEndpoint.endpointMovieRecommendation, arguments: parameters)
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
                    self.interactor?.setInfoMovieRecommended(completionData: .failure(error))
                }
            } receiveValue: { resultData in
                self.interactor?.setInfoMovieRecommended(completionData: .success(resultData.results))
            }
            .store(in: &cancellable)
    }
    
    func saveDataInFirebaseDBProvider(data: DetailMovieModel) {
        let movieId = "\(movieObject?.id ?? 0)"
        if "\(data.id ?? 0)" == movieId {
            dbFirebase.collection("myFavourites").document("movies").setData(["id": "\(data.id ?? 0)"]) { err in
                if let err = err {
                    print("Error writing document: \(err)")
                } else {
                    print("Document successfully written!")
                }
            }
        }
    }
    
}
