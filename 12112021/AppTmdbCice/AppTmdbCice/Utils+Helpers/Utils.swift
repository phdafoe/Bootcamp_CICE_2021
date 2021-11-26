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
    
    // Endpoint's of Movies
    static let endpointMoviesNowPlaying = "movie/now_playing?api_key=\(Obfuscator().reveal(key: Constants.Api.apiKey))"
    static let endpointMoviesPopular = "movie/popular?api_key=\(Obfuscator().reveal(key: Constants.Api.apiKey))"
    static let endpointMoviesTopRated = "movie/top_rated?api_key=\(Obfuscator().reveal(key: Constants.Api.apiKey))"
    static let endpointMoviesUpComing = "movie/upcoming?api_key=\(Obfuscator().reveal(key: Constants.Api.apiKey))"
    
    // Endpoint's of Tv
    static let endpointTvAiringToday = "tv/airing_today?api_key=\(Obfuscator().reveal(key: Constants.Api.apiKey))"
    static let endpointTvOnTheAir = "tv/on_the_air?api_key=\(Obfuscator().reveal(key: Constants.Api.apiKey))"
    static let endpointTvPopular = "tv/popular?api_key=\(Obfuscator().reveal(key: Constants.Api.apiKey))"
    static let endpointTvTopRated = "tv/top_rated?api_key=\(Obfuscator().reveal(key: Constants.Api.apiKey))"
    
    // Endpoint Movie Detail
    static let endpointDetailMovie = "movie/%@?api_key=\(Obfuscator().reveal(key: Constants.Api.apiKey))&append_to_response=%@" // videos,credits
    static let endpointDetailShow = "tv/%@?api_key=\(Obfuscator().reveal(key: Constants.Api.apiKey))&append_to_response=%@"  // videos,credits
    
    // Endpoint Movie Recommendations
    static let endpointMovieRecommendation = "movie/%@/recommendations?api_key=\(Obfuscator().reveal(key: Constants.Api.apiKey))"
    static let endpointShowsRecommendation = "tv/%@/recommendations?api_key=\(Obfuscator().reveal(key: Constants.Api.apiKey))"
    
    
}

extension URLEndpoint {
    static func getUrlBase(with urlContext: BaseURLContext) -> String {
        switch urlContext {
        case .backend:
            switch self.targetDefault{
            case .DEV:
                return ""
            case .PRE:
                return ""
            case .PRO:
                return ""
            }
        case .webService:
            switch self.targetDefault{
            case .DEV:
                return ""
            case .PRE:
                return ""
            case .PRO:
                return "https://api.themoviedb.org/3/"
            }
        case .heroku:
            switch self.targetDefault{
            case .DEV:
                return ""
            case .PRE:
                return ""
            case .PRO:
                return ""
            }
        case .firebase:
            switch self.targetDefault{
            case .DEV:
                return ""
            case .PRE:
                return ""
            case .PRO:
                return ""
            }
        }
    }
}
