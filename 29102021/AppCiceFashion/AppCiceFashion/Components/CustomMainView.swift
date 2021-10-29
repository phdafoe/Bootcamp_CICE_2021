//
//  CustomMainView.swift
//  AppCiceFashion
//
//  Created by Andres Felipe Ocampo Eljaiek on 29/10/21.
//

import SwiftUI

struct CustomMainView: View {
    var body: some View {
        VStack{
            HStack {
                Button(action: {
                    
                }) {
                    HStack{
                        Text("Casual Dress").font(.headline)
                        Spacer()
                        Image(systemName: "chevron.down").font(.title3)
                    }
                    .padding()
                }
                .foregroundColor(.black)
                
                Button(action: {
                    
                }) {
                    HStack{
                        Image(systemName: "slider.horizontal.3").padding()
                    }
                }
                .foregroundColor(.black)
                .contextMenu {
                    Text("Menu Item 1")
                    Text("Menu Item 2")
                    Text("Menu Item 3")
                }
            }
        }
    }
}

struct CustomMainView_Previews: PreviewProvider {
    static var previews: some View {
        CustomMainView()
    }
}
