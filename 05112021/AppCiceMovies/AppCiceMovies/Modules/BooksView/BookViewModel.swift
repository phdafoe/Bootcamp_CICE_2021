//
//  BookViewModel.swift
//  AppCiceMovies
//
//  Created by Andres Felipe Ocampo Eljaiek on 5/11/21.
//

import Foundation

final class BookViewModel: ObservableObject {
    
    @Published var arrayBooks: [ResultBooksViewModel]? = []
    
    let interactor: BooksInteractorProtocol = BooksInteractor()
    
    func fetchBooksApple() {
        self.interactor.fetchBooksAppleInteractor { [weak self] resultBooksViewModel in
            guard self != nil else { return }
            self?.arrayBooks?.removeAll()
            self?.arrayBooks = resultBooksViewModel
        }
    }
    
}
