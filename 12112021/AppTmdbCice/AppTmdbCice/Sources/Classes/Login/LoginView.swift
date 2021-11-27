//
//  LoginView.swift
//  AppTmdbCice
//
//  Created by Andres Felipe Ocampo Eljaiek on 27/11/21.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var viewModelSession: LoginViewModel
    @State var tipoAutentication: TipoAutenticacion
    
    @State var email: String = ""
    @State var password: String = ""
    @State var passwordConfirmation: String = ""
    @State var showPassword = false
    
    var body: some View {
        ZStack{
            VStack(spacing: 40){
                helloApp
                imageAppLogo
                if !viewModelSession.usuarioAutenticado {
                    VStack(spacing: 20) {
                        CustomTextField(placeholder: "email",
                                        title: "email",
                                        text: self.$email)
                            .padding(10)
                            .background(Color(red: 239/255, green: 243/255, blue: 244/255))
                            .cornerRadius(10)
                            .shadow(radius: 5)
                                                
                        if showPassword {
                            CustomTextField(placeholder: "password",
                                            title: "password",
                                            text: self.$password)
                                .padding(10)
                                .background(Color(red: 239/255, green: 243/255, blue: 244/255))
                                .cornerRadius(10)
                                .shadow(radius: 5)
                        } else {
                            CustomSecuretextField(placeholder: "password",
                                                  title: "password",
                                                  text: self.$password)
                                .padding(10)
                                .background(Color(red: 239/255, green: 243/255, blue: 244/255))
                                .cornerRadius(10)
                                .shadow(radius: 5)
                        }
                        
                        if tipoAutentication == .registro {
                            if showPassword {
                                CustomTextField(placeholder: "password confirmation",
                                                title: "password confirmation",
                                                text: self.$passwordConfirmation)
                                    .padding(10)
                                    .background(Color(red: 239/255, green: 243/255, blue: 244/255))
                                    .cornerRadius(10)
                                    .shadow(radius: 5)
                            } else {
                                CustomSecuretextField(placeholder: "password confirmation",
                                                      title: "password confirmation",
                                                      text: self.$passwordConfirmation)
                                    .padding(10)
                                    .background(Color(red: 239/255, green: 243/255, blue: 244/255))
                                    .cornerRadius(10)
                                    .shadow(radius: 5)
                            }
                        }
                        
                        Toggle("Show Password", isOn: self.$showPassword)
                            .padding(10)
                            .foregroundColor(Color.gray)
                            .font(.caption)
                        
                        // Boton de login / registro
                        Button(action: {
                            self.autenticationEmailPulsado()
                        }) {
                            Text(tipoAutentication.text)
                                .lineLimit(3)
                                .font(.headline)
                        }
                        .foregroundColor(Color.gray)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color(red: 239/255, green: 243/255, blue: 244/255))
                        .cornerRadius(25)
                        
                        // Boton de cambio formualario si estoy logado o no
                        Button(action: {
                            self.botonFooterPulsado()
                        }) {
                            Text(tipoAutentication.footerText)
                                .lineLimit(3)
                                .font(.headline)
                        }
                        .foregroundColor(Color.gray)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color(red: 239/255, green: 243/255, blue: 244/255))
                        .cornerRadius(25)
                    }
                }
            }
            .padding()
        }
    }
    
    var helloApp: some View {
        Text("Tmdb Shows")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 10)
            .foregroundColor(Color.gray)
        
    }
    var imageAppLogo: some View {
        Image("logo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(.horizontal, 20)
            .clipShape(Circle())
            .shadow(color: Color.black.opacity(0.5), radius: 20, x: 0, y: 0)
            .overlay(
                Circle()
                    .stroke(Color.red, lineWidth: 2)
            )
    }
    
    
    private func autenticationEmailPulsado() {
        switch tipoAutentication {
        case .login:
            self.viewModelSession.acceso(with: .emailAndPassword(email: self.email, password: self.password))
        case .registro:
            self.viewModelSession.registro(email: self.email, password: self.password, passwordConfirmation: self.passwordConfirmation)
        }
    }
    
    private func botonFooterPulsado() {
        self.limpiarCamposFormulario()
        self.tipoAutentication = tipoAutentication == .registro ? .login : .registro
    }
    
    private func limpiarCamposFormulario() {
        self.email = ""
        self.password = ""
        self.passwordConfirmation = ""
        self.showPassword = false
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(tipoAutentication: .registro)
    }
}
