//
//  User.swift
//  Moviesime
//
//  Created by Nouf on 22/01/2025.
//

import Foundation

struct User: Codable , Identifiable{
    let profile_image: String
    let email: String
    let name: String
    let password: String
    var id: UUID { UUID()}
}
