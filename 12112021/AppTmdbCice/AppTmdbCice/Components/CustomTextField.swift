//
//  CustomTextField.swift
//  AppTmdbCice
//
//  Created by Andres Felipe Ocampo Eljaiek on 27/11/21.
//

import SwiftUI

struct CustomTextField: View {
    
    var placeholder: String
    var title: String
    var text: Binding<String>
    
    var body: some View {
        HStack{
            Image(systemName: "person")
            ZStack(alignment: .leading) {
                Text(title)
                    .foregroundColor(Color.gray)
                    .offset(y: text.wrappedValue.isEmpty ? 0 : -25)
                    .scaleEffect(text.wrappedValue.isEmpty ? 1: 0.8, anchor: .leading)
                TextField(placeholder, text: text)
                    .foregroundColor(Color.black)
            }
            .padding(.top, 15)
            .animation(.spring(response: 0.2, dampingFraction: 0.5))
        }
        
    }
}



struct CustomSecuretextField: View {
    
    var placeholder: String
    var title: String
    var text: Binding<String>
    
    var body: some View {
        HStack{
            Image(systemName: "lock")
            ZStack(alignment: .leading) {
                Text(title)
                    .foregroundColor(Color.gray)
                    .offset(y: text.wrappedValue.isEmpty ? 0 : -25)
                    .scaleEffect(text.wrappedValue.isEmpty ? 1: 0.8, anchor: .leading)
                SecureField(placeholder, text: text)
                    .foregroundColor(Color.black)
                
            }
            .padding(.top, 15)
            .animation(.spring(response: 0.2, dampingFraction: 0.5))
        }
        
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomSecuretextField(placeholder: "email", title: "email", text: .constant("email"))
    }
}


