//
//  LoginViewModel.swift
//  AppTmdbCice
//
//  Created by Andres Felipe Ocampo Eljaiek on 27/11/21.
//

import Foundation
import FirebaseAuth

enum LoginOption {
    case inicioSesionConApple
    case emailAndPassword(email: String, password: String)
}

enum TipoAutenticacion: String {
    case login
    case registro
    
    var text: String {
        rawValue.capitalized
    }
    
    var footerText: String {
        switch self {
        case .login:
            return "No eres miembro aún, Registrate"
        case .registro:
            return "Listo para ser miembro de TMDB Shows?"
        }
    }
}


final class LoginViewModel: ObservableObject {
    
    @Published var usuarioLogado: User?
    @Published var cambioPassword: Bool?
    @Published var usuarioAutenticado = false
    @Published var error: NSError?
    
    private let authenticationData = Auth.auth()
    
    required init() {
        usuarioLogado = authenticationData.currentUser
        authenticationData.addStateDidChangeListener(estadoDeAutenticacionModificado)
    }
    
    private func estadoDeAutenticacionModificado(with auth: Auth, user: User?) {
        guard user != self.usuarioLogado else { return }
        self.usuarioLogado = user
    }
    
    // Login
    func acceso(with loginOption: LoginOption) {
        self.usuarioAutenticado = true
        self.error = nil
        switch loginOption {
        case .inicioSesionConApple:
            print("Login con Apple")
        case let .emailAndPassword(email, password):
            authenticationData.signIn(withEmail: email,
                                      password: password,
                                      completion: manejadorFoinalizacionDelResultadoDeAutenticacion)
        }
    }
    
    // Registro
    func registro(email: String, password: String, passwordConfirmation: String) {
        guard password == passwordConfirmation else {
            self.error = NSError(domain: "", code: 9210, userInfo: [NSLocalizedDescriptionKey : "La password y la confirmacion no son iguales"])
            return
        }
        self.usuarioAutenticado = true
        self.error = nil
        authenticationData.createUser(withEmail: email,
                                      password: password,
                                      completion: manejadorFoinalizacionDelResultadoDeAutenticacion)
    }
    
    // Logout
    func desconectarSesion() {
        do {
            try authenticationData.signOut()
        } catch {
            self.error = NSError(domain: "", code: 9999, userInfo: [NSLocalizedDescriptionKey : "El usuario no ha logrado desconectar la sesion"])
        }
    }
    
    
    // Callback
    private func manejadorFoinalizacionDelResultadoDeAutenticacion(with auth: AuthDataResult?, and error: Error?) {
        DispatchQueue.main.async {
            self.usuarioAutenticado = false
            if let user = auth?.user {
                self.usuarioLogado = user
            } else if let errorDes = error {
                self.error = errorDes as NSError
            }
        }
    }
}
