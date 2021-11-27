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
                        Image(systemName: "tv")
                        Text("Tv")
                    }
                }
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
