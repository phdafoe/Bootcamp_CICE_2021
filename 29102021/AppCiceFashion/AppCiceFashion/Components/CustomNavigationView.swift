//
//  CustomNavigationView.swift
//  AppCiceFashion
//
//  Created by Andres Felipe Ocampo Eljaiek on 29/10/21.
//

import SwiftUI

struct CustomNavigationView: View {
    
    @State private var showAlert = false
    @State private var showAlertDos = false
    @Binding var showCustomAlertView: Bool
    
    var body: some View {
        ZStack{
            
            Text("Seasons").font(.system(size: 20))
            
            HStack(spacing: 8) {
                
                Button(action: {
                    self.showAlert = true
                }) {
                    Image(systemName: "slider.horizontal.3")
                }
                .alert(isPresented: self.$showAlert) {
                    Alert(title: Text("Hola!"),
                          message: Text("Aqui tenemos una Alerta"),
                          primaryButton: .default(Text("OK"), action: {
                        //
                    }),
                          secondaryButton: .cancel(Text("cancel"), action: {
                        //
                    }))
                }
                
                Spacer()

                Button(action: {
                    self.showAlertDos.toggle()
                }) {
                    Image(systemName: "magnifyingglass")
                }
                .alert("Importante", isPresented: self.$showAlertDos) {
                    Button("OK") {
                        //
                    }
                    Button(role: .cancel) {
                        //
                    } label: {
                        Text("Cancel")
                    }
                }
                
                Button(action: {
                    
                }) {
                    Image(systemName: "alarm")
                }
                
                Button(action: {
                    self.showCustomAlertView.toggle()
                }) {
                    Image(systemName: "cart")
                }
            }
            .padding(.horizontal, 8)
            .font(.callout)
            .foregroundColor(.black)
        }
        .background(Color.white)
        
    }
}


//struct CustomNavigationView_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomNavigationView()
//    }
//}
