//
// Created on 3/12/21.
// SearchView.swift - Very brief description
//


import SwiftUI

struct SearchView: View {
    
    // MARK: ObservedObject -> MVVM Dependencies
    @ObservedObject var viewModel: SearchViewModel
    
    var body: some View {
        ScrollView{
            SearchBarView(placeholder: "search", text: self.$viewModel.query)
                .listRowInsets(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
            
            if self.viewModel.arrayMovies != nil {
                ForEach(self.viewModel.arrayMovies!) { movie in
                    NavigationLink(destination: DetailMovieCoordinator.view(dto: DetailMovieCoordinatorDTO(movieObject: movie))) {
                        MoviePosterCell(model: movie, isPoster: true)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            } else {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal, 20)
                    .clipShape(Circle())
                    .shadow(color: Color.black.opacity(0.5), radius: 20, x: 0, y: 0)
                    .overlay(
                        Circle()
                            .stroke(Color.red, lineWidth: 2)
                    )
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("")
        .navigationTitle("Search your Movie")
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


