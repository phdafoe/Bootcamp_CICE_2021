//
//  ContentView.swift
//  AppTmdbCice
//
//  Created by Andres Felipe Ocampo Eljaiek on 12/11/21.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("currentPage") var currentPage = 1
    @EnvironmentObject var viewModelSession: LoginViewModel
    
    var body: some View {
        if currentPage > totalPages {
            if self.viewModelSession.usuarioLogado != nil {
                HomeView()
            } else {
                LoginView(tipoAutentication: .registro)
            }
        } else {
            OnBoardingView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
