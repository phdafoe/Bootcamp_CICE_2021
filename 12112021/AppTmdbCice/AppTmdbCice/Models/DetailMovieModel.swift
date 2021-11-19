//
//  DetailMovieModel.swift
//  AppTmdbCice
//
//  Created by Andres Felipe Ocampo Eljaiek on 13/11/21.
//

import Foundation

// MARK: - DetailMovieModel
struct DetailMovieModel: Codable {
    let adult: Bool?
    let backdropPath: String?
    let belongsToCollection: BelongsToCollection?
    let budget: Int?
    let genres: [Genre]?
    let homepage: String?
    let id: Int?
    let imdbid: String?
    let originalLanguage: String?
    let originalTitle: String?
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let productionCompanies: [ProductionCompany]?
    let productionCountries: [ProductionCountry]?
    let releaseDate: String?
    let revenue: Int?
    let runtime: Int?
    let spokenLanguages: [SpokenLanguage]?
    let status: String?
    let tagline: String?
    let title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    let videos: Videos?
    let credits: Credits?

    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case backdropPath = "backdrop_path"
        case belongsToCollection = "belongs_to_collection"
        case budget = "budget"
        case genres = "genres"
        case homepage = "homepage"
        case id = "id"
        case imdbid = "imdb_id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview = "overview"
        case popularity = "popularity"
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case releaseDate = "release_date"
        case revenue = "revenue"
        case runtime = "runtime"
        case spokenLanguages = "spoken_languages"
        case status = "status"
        case tagline = "tagline"
        case title = "title"
        case video = "video"
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
    
    var durationText: String {
        guard let runTimeDes = self.runtime, runTimeDes > 0 else  {
            return "n/a"
        }
        return DetailMovieModel.durationFormatter.string(from: TimeInterval(runTimeDes) * 60) ?? "n/a"
    }
    
    var yearText: String {
        guard let releasedDateDes = self.releaseDate, let date = DetailMovieModel.dateFormatter.date(from: releasedDateDes) else {
            return "n/a"
        }
        return DetailMovieModel.yearFormmater.string(from: date)
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

// MARK: - BelongsToCollection
struct BelongsToCollection: Codable {
    let id: Int?
    let name: String?
    let posterPath: String?
    let backdropPath: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
    }
}

// MARK: - Credits
struct Credits: Codable {
    let cast: [Cast]?
    let crew: [Crew]?

    enum CodingKeys: String, CodingKey {
        case cast = "cast"
        case crew = "crew"
    }
}

// MARK: - Cast
struct Cast: Codable, Identifiable {
    let adult: Bool?
    let gender: Int?
    let id: Int?
    let knownForDepartment: String?
    let name: String?
    let originalName: String?
    let popularity: Double?
    let profilePath: String?
    let castid: Int?
    let character: String?
    let creditid: String?
    let order: Int?

    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case gender = "gender"
        case id = "id"
        case knownForDepartment = "known_for_department"
        case name = "name"
        case originalName = "original_name"
        case popularity = "popularity"
        case profilePath = "profile_path"
        case castid = "cast_id"
        case character = "character"
        case creditid = "credit_id"
        case order = "order"
    }
    
    var profilePathUrl: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500/\(profilePath ?? "")")!
    }
}

// MARK: - Crew
struct Crew: Codable, Identifiable {
    let adult: Bool?
    let gender: Int?
    let id: Int?
    let knownForDepartment: String?
    let name: String?
    let originalName: String?
    let popularity: Double?
    let profilePath: String?
    let creditid: String?
    let department: String?
    let job: String?

    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case gender = "gender"
        case id = "id"
        case knownForDepartment = "known_for_department"
        case name = "name"
        case originalName = "original_name"
        case popularity = "popularity"
        case profilePath = "profile_path"
        case creditid = "credit_id"
        case department = "department"
        case job = "job"
    }
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
}

// MARK: - ProductionCompany
struct ProductionCompany: Codable {
    let id: Int?
    let logoPath: String?
    let name: String?
    let originCountry: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case logoPath = "logo_path"
        case name = "name"
        case originCountry = "origin_country"
    }
}

// MARK: - ProductionCountry
struct ProductionCountry: Codable {
    let iso3166_1: String?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case iso3166_1 = "iso_3166_1"
        case name = "name"
    }
}

// MARK: - SpokenLanguage
struct SpokenLanguage: Codable {
    let englishName: String?
    let iso639_1: String?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case englishName = "english_name"
        case iso639_1 = "iso_639_1"
        case name = "name"
    }
}

// MARK: - Videos
struct Videos: Codable {
    let results: [ResultVideos]?

    enum CodingKeys: String, CodingKey {
        case results = "results"
    }
}

// MARK: - Result
struct ResultVideos: Codable, Identifiable {
    let iso639_1: String?
    let iso3166_1: String?
    let name: String?
    let key: String?
    let site: String?
    let size: Int?
    let type: String?
    let official: Bool?
    let publishedAt: String?
    let id: String?

    enum CodingKeys: String, CodingKey {
        case iso639_1 = "iso_639_1"
        case iso3166_1 = "iso_3166_1"
        case name = "name"
        case key = "key"
        case site = "site"
        case size = "size"
        case type = "type"
        case official = "official"
        case publishedAt = "published_at"
        case id = "id"
    }
    
    var youtubeURL: URL? {
        guard site == "YouTube" else {
            return nil
        }
        return URL(string: "https://youtube.com/watch?v=\(key!)")
    }
}

extension DetailMovieModel {
    
    static var stubbedDetailMovieModel: DetailMovieModel {
        let response: DetailMovieModel? = try? Bundle.main.loadAndDecodeJSON(filename: "DetailMovie")
        return response!
    }
    
}
