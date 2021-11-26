//
//  DetailShowModel.swift
//  AppTmdbCice
//
//  Created by Andres Felipe Ocampo Eljaiek on 20/11/21.
//

import Foundation

// MARK: - DetailShowModel
struct DetailShowModel: Codable {
    let backdropPath: String?
    let createdBy: [CreatedBy]?
    let episodeRunTime: [Int]?
    let firstAirDate: String?
    let genres: [Genre]?
    let homepage: String?
    let id: Int?
    let inProduction: Bool?
    let languages: [String]?
    let lastAirDate: String?
    let lastEpisodeToAir: TEpisodeToAir?
    let name: String?
    let nextEpisodeToAir: TEpisodeToAir?
    let networks: [Network]?
    let numberOfEpisodes: Int?
    let numberOfSeasons: Int?
    let originCountry: [String]?
    let originalLanguage: String?
    let originalName: String?
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let productionCompanies: [ProductionCompany]?
    let productionCountries: [ProductionCountry]?
    let seasons: [Season]?
    let spokenLanguages: [SpokenLanguage]?
    let status: String?
    let tagline: String?
    let type: String?
    let voteAverage: Double?
    let voteCount: Int?
    let videos: Videos?
    let credits: Credits?

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case createdBy = "created_by"
        case episodeRunTime = "episode_run_time"
        case firstAirDate = "first_air_date"
        case genres = "genres"
        case homepage = "homepage"
        case id = "id"
        case inProduction = "in_production"
        case languages = "languages"
        case lastAirDate = "last_air_date"
        case lastEpisodeToAir = "last_episode_to_air"
        case name = "name"
        case nextEpisodeToAir = "next_episode_to_air"
        case networks = "networks"
        case numberOfEpisodes = "number_of_episodes"
        case numberOfSeasons = "number_of_seasons"
        case originCountry = "origin_country"
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview = "overview"
        case popularity = "popularity"
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case seasons = "seasons"
        case spokenLanguages = "spoken_languages"
        case status = "status"
        case tagline = "tagline"
        case type = "type"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case videos = "videos"
        case credits = "credits"
    }
    
    var posterUrl: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500/\(posterPath ?? "")")!
    }
    
    var genreText: String {
        genres?.first?.name ?? "n/a"
    }
    
//    var durationText: String {
//        guard let runTimeDes = self.runtime, runTimeDes > 0 else  {
//            return "n/a"
//        }
//        return DetailMovieModel.durationFormatter.string(from: TimeInterval(runTimeDes) * 60) ?? "n/a"
//    }
    
    var yearText: String {
        guard let releasedDateDes = self.firstAirDate, let date = DetailMovieModel.dateFormatter.date(from: releasedDateDes) else {
            return "n/a"
        }
        return DetailShowModel.yearFormmater.string(from: date)
    }
    
    var ratingText: String {
        let rating = Int(voteAverage ?? 0)
        let ratingText = (0..<rating).reduce("") { (acc, _) -> String in
            return acc + "★"
        }
        return ratingText
    }
    
    var scoreText: String {
        guard ratingText.count > 0 else {
            return "n/a"
        }
        return "\(ratingText.count) / 10"
    }
    
    var cast: [Cast]? {
        credits?.cast
    }
    
    var crew: [Crew]? {
        credits?.crew
    }
    
    var directors: [Crew]? {
        crew?.filter { $0.job?.lowercased() == "director"}
    }
    
    var producers: [Crew]? {
        crew?.filter { $0.job?.lowercased() == "producers"}
    }
    
    var screenWriters: [Crew]? {
        crew?.filter { $0.job?.lowercased() == "story"}
    }
    
    var youtubeTrailers: [ResultVideos]? {
        videos?.results?.filter { $0.youtubeURL != nil }
    }
    
    // Private lets
    static private let durationFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .full
        formatter.allowedUnits = [.hour, .minute]
        return formatter
    }()
    
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter ()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        return dateFormatter
    }()
    
    static private let yearFormmater: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        return formatter
    }()
}


// MARK: - TEpisodeToAir
struct TEpisodeToAir: Codable {
    let airDate: String?
    let episodeNumber: Int?
    let id: Int?
    let name: String?
    let overview: String?
    let productionCode: String?
    let seasonNumber: Int?
    let stillPath: String?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case airDate = "air_date"
        case episodeNumber = "episode_number"
        case id = "id"
        case name = "name"
        case overview = "overview"
        case productionCode = "production_code"
        case seasonNumber = "season_number"
        case stillPath = "still_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

// MARK: - Network
struct Network: Codable {
    let name: String?
    let id: Int?
    let logoPath: String?
    let originCountry: String?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case id = "id"
        case logoPath = "logo_path"
        case originCountry = "origin_country"
    }
}


// MARK: - Season
struct Season: Codable {
    let airDate: String?
    let episodeCount: Int?
    let id: Int?
    let name: String?
    let overview: String?
    let posterPath: String?
    let seasonNumber: Int?

    enum CodingKeys: String, CodingKey {
        case airDate = "air_date"
        case episodeCount = "episode_count"
        case id = "id"
        case name = "name"
        case overview = "overview"
        case posterPath = "poster_path"
        case seasonNumber = "season_number"
    }
}

// MARK: - Created by
struct CreatedBy: Codable {
    let id: Int?
    let credit_id: String?
    let name: String?
    let gender: Int?
    let profile_path: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case credit_id = "credit_id"
        case name = "name"
        case gender = "gender"
        case profile_path = "profile_path"
    }
    
}

extension DetailShowModel {
    
    static var stubbedDetailShowModel: DetailShowModel {
        let response: DetailShowModel? = try? Bundle.main.loadAndDecodeJSON(filename: "DetailShow")
        return response!
    }
    
}


