//
//  Created on 3/12/21.
// ShowsFavorite.swift - Very brief description
//


import Foundation
import Combine
import FirebaseFirestore

// Mark: - Input Provider
protocol ShowsFavoriteProviderInputProtocol: BaseProviderInputProtocol {
    func fetchDataDetailMovieFromFirebase()
}

final class ShowsFavoriteProvider: BaseProvider {

    // MARK: - VIP Dependences
    weak var interactor: ShowsFavoriteProviderOutputProtocol? {
        super.baseInteractor as? ShowsFavoriteProviderOutputProtocol
    }
    
    let networkService: NetworkServiceProtocol = NetworkService()
    var cancellable: Set<AnyCancellable> = []
    
    private var dbFirebase = Firestore.firestore()
    let supportParameters = "videos,credits"
    
    func getFromFirebaseFavouritesMovies(completionHandler: @escaping ([String]) -> ()) {
        var myFavourite: [String] = []
        dbFirebase.collection("myFavourites").document("movies").getDocument{ document, error in
            if error == nil {
                if let documentdes = document{
                    let data = documentdes.data()
                    let id = data?["id"] as? String ?? ""
                    myFavourite.append(id)
                    completionHandler(myFavourite)
                }
            }
        }
    }
    
}

// Mark: - extension -> Input Provider
extension ShowsFavoriteProvider: ShowsFavoriteProviderInputProtocol {
    
    func fetchDataDetailMovieFromFirebase() {
        
        self.getFromFirebaseFavouritesMovies { arrayString in
            for item in arrayString{
                let movieId = item
                let parameters: [CVarArg] = [movieId, self.supportParameters]
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
                            debugPrint(error)
                            //self.interactor?.setInfoDetailMovie(completionData: .failure(error))
                        }
                    } receiveValue: { resultData in
                        //self.interactor?.setInfoDetailMovie(completionData: .success(resultData))
                    }
                    .store(in: &self.cancellable)
            }
        }
    }
}


