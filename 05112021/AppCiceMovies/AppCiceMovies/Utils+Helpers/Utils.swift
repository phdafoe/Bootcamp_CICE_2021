//
//  Utils.swift
//  AppCiceMovies
//
//  Created by Andres Felipe Ocampo Eljaiek on 5/11/21.
//

import Foundation

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
}

enum CustomTargets: Int {
    case DEV = 0
    case PRE = 1
    case PRO = 2
}

struct RequestDTO {
    var params: [String: Any]?
    var arrayParams: [[String: Any]]?
    var method: HTTPMethods
    var urlContext: URLEndpoint.BaseURLContext
    var endpoint: String
}

struct URLEndpoint {
    #if DEV
    static let targetDefault: CustomTargets = CustomTargets.DEV
    #elseif PRE
    static let targetDefault: CustomTargets = CustomTargets.PRE
    #else
    static let targetDefault: CustomTargets = CustomTargets.PRO
    #endif
    
    enum BaseURLContext {
        case backend
        case webService
        case heroku
        case firebase
    }
    
    static let endpointBooks = "books/top-free/20/books.json"
}

extension URLEndpoint {
    static func getUrlBase(with urlContext: BaseURLContext) -> String {
        switch urlContext {
        case .backend:
            switch self.targetDefault{
            case .DEV:
                return "https://rss.applemarketingtools.com/api/v2/es/"
            case .PRE:
                return "https://rss.applemarketingtools.com/api/v3/es/"
            case .PRO:
                return "https://rss.applemarketingtools.com/api/v4/es/"
            }
        case .webService:
            switch self.targetDefault{
            case .DEV:
                return ""
            case .PRE:
                return ""
            case .PRO:
                return "https://rss.applemarketingtools.com/api/v2/es/"
            }
        case .heroku:
            switch self.targetDefault{
            case .DEV:
                return "https://heroku.com/api/v2/es/"
            case .PRE:
                return "https://heroku.com/api/v3/es/"
            case .PRO:
                return "https://heroku.com/api/v4/es/"
            }
        case .firebase:
            switch self.targetDefault{
            case .DEV:
                return "https://firebase.com/api/v2/es/"
            case .PRE:
                return "https://firebase.com/api/v3/es/"
            case .PRO:
                return "https://firebase.com/api/v4/es/"
            }
        }
    }
}
