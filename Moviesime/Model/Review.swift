//
//  Review.swift
//  Moviesime
//
//  Created by Nouf on 21/01/2025.
//

import Foundation

struct Review: Hashable, Codable{
    let rate: Double
    let review_text: String
    let movie_id: String
    let user_id: String
}
