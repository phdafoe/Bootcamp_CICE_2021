//
//  Utils.swift
//  CiceCupon
//
//  Created by Andres Felipe Ocampo Eljaiek on 15/10/21.
//

import Foundation
import UIKit

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case put = "PUT"
    case options = "OPTIONS"
}

struct RequestDTO {
    
    var params: [String: AnyObject]?
    var arrayParams: [[String: AnyObject]]?
    var method: HTTPMethods
    var endpoint: String
    
    init(params: [String: AnyObject]?, method: HTTPMethods, endpoint: String) {
        self.params = params
        self.method = method
        self.endpoint = endpoint
    }
    
    init(arrayParams: [[String: AnyObject]]?, method: HTTPMethods, endpoint: String) {
        self.arrayParams = arrayParams
        self.method = method
        self.endpoint = endpoint
    }
    
}

struct URLEnpoint {
    #if DEV
    static let baseUrl = "https://rss.applemarketingtools.com/api/v2/us/"
    static let music = "music/most-played/%@/songs.json"
    static let podcast = "podcasts/top/%@/podcast-episodes.json"
    static let books = "books/top-free/%@/books.json"
    static let apps = "apps/top-free/%@/apps.json"
    #endif
}

class Utils {
    
    struct Constantes {
        let kUsuario = "USUARIO"
        let kContrasena = "CONTRASENA"
        let kUsuarioLogado = "LOGADO"
        let kPreferences = UserDefaults.standard
    }
    
    static func muestraAlerta(titulo: String, mensaje: String) -> UIAlertController {
        let alertVC = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default))
        return alertVC
    }
    
}
