//
//  CustomNavigationView.swift
//  AppCiceFashion
//
//  Created by Andres Felipe Ocampo Eljaiek on 29/10/21.
//

import SwiftUI

struct CustomNavigationView: View {
    var body: some View {
        ZStack{
            
            Text("Seasons").font(.system(size: 20))
            
            HStack(spacing: 8) {
                
                Button(action: {
                    
                }) {
                    Image(systemName: "slider.horizontal.3")
                }
                
                Spacer()

                Button(action: {
                    
                }) {
                    Image(systemName: "magnifyingglass")
                }
                
                Button(action: {
                    
                }) {
                    Image(systemName: "alarm")
                }
                
                Button(action: {
                    
                }) {
                    Image(systemName: "cart")
                }
            }
            .font(.callout)
            .foregroundColor(.black)
        }
        .background(Color.white)
        .padding(.horizontal, 8)
    }
}

struct CustomNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationView()
    }
}
