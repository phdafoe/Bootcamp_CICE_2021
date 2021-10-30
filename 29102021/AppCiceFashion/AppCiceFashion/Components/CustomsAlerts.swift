//
//  CustomsAlerts.swift
//  AppCiceFashion
//
//  Created by Andres Felipe Ocampo Eljaiek on 30/10/21.
//

import Foundation
import SwiftUI


struct CustomAlertView: View {
    
    var title: String
    var message: String
    @Binding var hideCustomAlertView: Bool
    
    var body: some View {
        ZStack{
            Color.black.opacity(0.3)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 20) {
                HStack{
                    Spacer()
                    Text(title)
                        .bold()
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                    Spacer()
                    Button {
                        self.hideCustomAlertView = false
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
                Divider()
                Text(message)
                    .font(.custom("Arial", size: 14))
            }
            .padding()
            .frame(width: UIScreen.main.bounds.width * 0.70)
            .background(Color.white)
            .foregroundColor(.black)
            .cornerRadius(10)
            .shadow(radius: 10)
        }
    }
}


struct CustomAlertView_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlertView(title: "AQUI ANDRES", message: "AQUI AN DRES MAS MENSAJE", hideCustomAlertView: .constant(true))
    }
}
