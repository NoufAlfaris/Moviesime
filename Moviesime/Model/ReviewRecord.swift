//
//  ReviewField.swift
//  Moviesime
//
//  Created by Nouf on 22/01/2025.
//

import Foundation

struct ReviewRecord: Hashable, Codable{
    var id: String? = nil
    var createdTime: String? = nil
    let fields: Review
}
