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
                                              isPosterFromMoviesView: true,
                                              moviesModel: self.viewModel.arrayMoviesNowPlaying)
                }
            }.listRowInsets(EdgeInsets(top: 16,
                                       leading: 0,
                                       bottom: 8,
                                       trailing: 0))
            
            Group{
                if !self.viewModel.arrayMoviesPopular.isEmpty {
                    MoviesPosterCarrouselView(title: "Popular",
                                              isPosterFromMoviesView: false,
                                              moviesModel: self.viewModel.arrayMoviesPopular)
                }
            }
            .listRowInsets(EdgeInsets(top: 16,
                                       leading: 16,
                                       bottom: 8,
                                       trailing: 16))
            
            Group{
                if !self.viewModel.arrayMoviesTopRated.isEmpty {
                    MoviesPosterCarrouselView(title: "Top Rated",
                                              isPosterFromMoviesView: false,
                                              moviesModel: self.viewModel.arrayMoviesTopRated)
                }
            }
            .listRowInsets(EdgeInsets(top: 16,
                                       leading: 16,
                                       bottom: 8,
                                       trailing: 16))
            
            Group{
                if !self.viewModel.arrayMoviesUpComing.isEmpty {
                    MoviesPosterCarrouselView(title: "Up Coming",
                                              isPosterFromMoviesView: true,
                                              moviesModel: self.viewModel.arrayMoviesUpComing)
                }
            }
            .listRowInsets(EdgeInsets(top: 16,
                                       leading: 16,
                                       bottom: 8,
                                       trailing: 16))
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
