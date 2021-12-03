//
// Created on 3/12/21.
// SearchView.swift - Very brief description
//


import SwiftUI

struct SearchView: View {
    
    // MARK: ObservedObject -> MVVM Dependencies
    @ObservedObject var viewModel: SearchViewModel
    
    var body: some View {
        List{
            SearchBarView(placeholder: "search", text: self.$viewModel.query)
                .listRowInsets(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
            
            if self.viewModel.arrayMovies != nil {
                ForEach(self.viewModel.arrayMovies!) { movie in
                    MoviePosterCell(model: movie, isPoster: true)
                }
            }
        }
        .listStyle(PlainListStyle())
        .onAppear {
            self.viewModel.startObserve()
        }
    }
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: SearchViewModel())
            .environment(\.colorScheme, .dark)
    }
}


