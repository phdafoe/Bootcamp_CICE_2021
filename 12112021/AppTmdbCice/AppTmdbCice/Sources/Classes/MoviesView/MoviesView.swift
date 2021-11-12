//
//  MoviesView.swift
//  AppTmdbCice
//
//  Created by Andres Felipe Ocampo Eljaiek on 12/11/21.
//

import SwiftUI

struct MoviesView: View {
    
    @ObservedObject var viewModel: MoviesViewModel
    
    var body: some View {
        List{
            Group{
                if !self.viewModel.arrayMoviesNowPlaying.isEmpty {
                    MoviesPosterCarrouselView(title: "Now Playing",
                                              moviesModel: self.viewModel.arrayMoviesNowPlaying)
                }
            }.listRowInsets(EdgeInsets(top: 16,
                                       leading: 0,
                                       bottom: 8,
                                       trailing: 0))
            
            Group{
                if !self.viewModel.arrayMoviesPopular.isEmpty {
                    MoviesPosterCarrouselView(title: "Popular",
                                              moviesModel: self.viewModel.arrayMoviesPopular)
                }
            }
            .listRowInsets(EdgeInsets(top: 16,
                                       leading: 0,
                                       bottom: 8,
                                       trailing: 0))
        }
        .listStyle(PlainListStyle())
        .navigationBarTitle("Movies")
        .onAppear {
            self.viewModel.fetchData()
        }
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView(viewModel: MoviesViewModel())
    }
}
