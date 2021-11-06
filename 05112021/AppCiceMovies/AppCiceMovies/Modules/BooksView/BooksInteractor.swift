//
//  BooksInteractor.swift
//  AppCiceMovies
//
//  Created by Andres Felipe Ocampo Eljaiek on 6/11/21.
//

import Foundation

protocol BooksInteractorProtocol {
    func fetchBooksAppleInteractor(completionHandler: @escaping ([ResultBooksViewModel]) -> ())
}

final class BooksInteractor {
    
    let provider: BooksProviderProtocol = BooksProvider()
    
    func transformDataAppleRssServerModelToBooksModelView(with data: AppleRssServerModel) -> BooksModelView {
        var arrayResultModelView = [ResultBooksViewModel]()
        if let dataDes = data.feed?.results {
            for item in 0..<dataDes.count {
                let model = ResultBooksViewModel(artistName: dataDes[item].artistName,
                                                 id: dataDes[item].id,
                                                 releaseDate: dataDes[item].releaseDate,
                                                 artworkUrl100: dataDes[item].artworkUrl100,
                                                 url: dataDes[item].url)
                arrayResultModelView.append(model)
            }
        }
        let object = BooksModelView(results: arrayResultModelView)
        return object
    }
      
}

extension BooksInteractor: BooksInteractorProtocol {
    
    func fetchBooksAppleInteractor(completionHandler: @escaping ([ResultBooksViewModel]) -> ()) {
        self.provider.fetchBooksAppleProvider { [weak self] (resultData) in
            guard self != nil else { return }
            switch resultData {
            case .success(let response):
                completionHandler(self?.transformDataAppleRssServerModelToBooksModelView(with: response).results ?? [])
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
    
}
