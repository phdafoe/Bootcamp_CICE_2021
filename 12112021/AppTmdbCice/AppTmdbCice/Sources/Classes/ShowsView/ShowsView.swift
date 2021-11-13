//
//  ShowsView.swift
//  AppTmdbCice
//
//  Created by Andres Felipe Ocampo Eljaiek on 13/11/21.
//

import SwiftUI

struct ShowsView: View {
    
    @ObservedObject var viewModel: ShowsViewModel
    
    var body: some View {
        List{
            Group{
                if !self.viewModel.arrayTvAiringToday.isEmpty {
                    ShowsPosterCarrouselView(title: "Airing Today",
                                             isPosterFromShowsView: true,
                                             showsModel: self.viewModel.arrayTvAiringToday)
                }
            }.listRowInsets(EdgeInsets(top: 16,
                                       leading: 0,
                                       bottom: 8,
                                       trailing: 0))
            
            Group{
                if !self.viewModel.arrayTvOnTheAir.isEmpty {
                    ShowsPosterCarrouselView(title: "On The Air",
                                             isPosterFromShowsView: true,
                                             showsModel: self.viewModel.arrayTvOnTheAir)
                }
            }
            .listRowInsets(EdgeInsets(top: 16,
                                       leading: 0,
                                       bottom: 8,
                                       trailing: 0))
            
            Group{
                if !self.viewModel.arrayTvPopular.isEmpty {
                    ShowsPosterCarrouselView(title: "Tv Popular",
                                             isPosterFromShowsView: false,
                                             showsModel: self.viewModel.arrayTvPopular)
                }
            }
            .listRowInsets(EdgeInsets(top: 16,
                                       leading: 16,
                                       bottom: 8,
                                       trailing: 16))
            
            Group{
                if !self.viewModel.arrayTvTopRated.isEmpty {
                    ShowsPosterCarrouselView(title: "Top Rated",
                                             isPosterFromShowsView: false,
                                             showsModel: self.viewModel.arrayTvTopRated)
                }
            }
            .listRowInsets(EdgeInsets(top: 16,
                                       leading: 16,
                                       bottom: 8,
                                       trailing: 16))

        }
        .listStyle(PlainListStyle())
        .navigationBarTitle("Tv Shows")
        .onAppear {
            self.viewModel.fetchTvShowsData()
        }
    }
}

struct ShowsView_Previews: PreviewProvider {
    static var previews: some View {
        ShowsView(viewModel: ShowsViewModel())
    }
}
