//
//  ActorRecord.swift
//  Moviesime
//
//  Created by Nouf on 22/01/2025.
//

import Foundation

struct ActorRecord: Codable, Hashable {
    let id: String
    let createdTime: String
    let fields: Actor
}
