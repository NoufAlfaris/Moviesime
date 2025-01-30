//
//  Movie.swift
//  Moviesime
//
//  Created by Nouf on 21/01/2025.
//

import Foundation

struct Movie: Codable, Hashable{
//    let name: String
//    let rating: String
//    let genre: [String]
//    let poster : String
//    let language: [String]
//    let IMDb_rating: Double
//    let runtime: String
//    let story: String

    let name, rating: String
    let genre: [String]
    let poster: String
    let language: [String]
    let imDBRating: Double
    let runtime, story: String
    
    enum CodingKeys: String, CodingKey {
        case name, rating, genre, poster, language
        case imDBRating = "IMDb_rating"
        case runtime, story
    }
}
