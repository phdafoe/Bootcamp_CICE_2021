//
//  ContentView.swift
//  AppTmdbCice
//
//  Created by Andres Felipe Ocampo Eljaiek on 12/11/21.
//

import SwiftUI

struct ContentView: View {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
