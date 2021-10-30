//
//  ContentView.swift
//  AppCiceFashion
//
//  Created by Andres Felipe Ocampo Eljaiek on 29/10/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showCustomAlertView = false
    
    var body: some View {
        NavigationView {
            ZStack{
                VStack{
                    CustomNavigationView(showCustomAlertView: self.$showCustomAlertView)
                    CustomMainView()
                }
                .blur(radius: self.showCustomAlertView ? 3 : 0)
                
                if self.showCustomAlertView {
                    CustomAlertView(title: "Custom Alert View",
                                    message: "Este es una alerta personalizada y se colocará encima de la vista principal y se hara un efecto de blur y el fondo medio opaco",
                                    hideCustomAlertView: self.$showCustomAlertView)
                }
                
            }.navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
