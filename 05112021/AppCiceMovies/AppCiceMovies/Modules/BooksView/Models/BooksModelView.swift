//
//  BooksModelView.swift
//  AppCiceMovies
//
//  Created by Andres Felipe Ocampo Eljaiek on 6/11/21.
//

import Foundation

struct BooksModelView {
    let results: [ResultBooksViewModel]?
}

struct ResultBooksViewModel: Identifiable {
    let artistName: String?
    let id: String?
    let releaseDate: String?
    let artworkUrl100: String?
    let url: String?
}
