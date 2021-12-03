//
//  HomeView.swift
//  AppTmdbCice
//
//  Created by Andres Felipe Ocampo Eljaiek on 27/11/21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            MoviesCoordinator.navigation()
                .tabItem {
                    VStack{
                        Image(systemName: "tv")
                        Text("Movies")
                    }
                }
            
            ShowsCoordinator.navigation()
                .tabItem {
                    VStack{
                        Image(systemName: "play.tv.fill")
                        Text("Tv")
                    }
                }
            
            PeopleCoordinator.navigation()
                .tabItem {
                    VStack{
                        Image(systemName: "person.2.circle")
                        Text("People")
                    }
                }
            
            ShowsFavoriteCoordinator.navigation()
                .tabItem {
                    VStack{
                        Image(systemName: "bookmark.fill")
                        Text("Favorites")
                    }
                }
            
            
            SearchCoordinator.navigation()
                .tabItem {
                    VStack{
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                }
            
//            SetupView()
//                .tabItem {
//                    VStack{
//                        Image(systemName: "person.fill")
//                        Text("Perfil")
//                    }
//                }
        }
        .accentColor(.red)
        .environment(\.colorScheme, .dark)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
