//
//  BooksView.swift
//  AppCiceMovies
//
//  Created by Andres Felipe Ocampo Eljaiek on 5/11/21.
//

import SwiftUI

struct BooksView: View {
    
    @ObservedObject var viewModel = BookViewModel()
    
    var body: some View {
        VStack {
            Text(self.viewModel.arrayBooks[0].artistName ?? "AQUI ANDRES")
        }.onAppear {
            self.viewModel.fetchBooksApple()
        }
    }
}

struct BooksView_Previews: PreviewProvider {
    static var previews: some View {
        BooksView()
    }
}
