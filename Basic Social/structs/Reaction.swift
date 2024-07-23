//
//  Reaction.swift
//  Basic Social
//
//  Created by Jacob on 7/22/24.
//

import Foundation

struct Reactions: Decodable {
    var id: UUID { UUID() }
    var likes: Int
    var dislikes: Int
}
