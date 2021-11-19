//
//  MoviesShowsModel.swift
//  AppTmdbCice
//
//  Created by Andres Felipe Ocampo Eljaiek on 19/11/21.
//

import Foundation

struct MoviesShowsModel: Identifiable {
    let id: Int?
    let backdropPath: String?
    let posterPath: String?
    let name: String?
    
    var posterUrl: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500/\(posterPath ?? "")")!
    }
    
    var backdropUrl : URL {
        return URL(string: "https://image.tmdb.org/t/p/w500/\(backdropPath ?? "")")!
    }
}
