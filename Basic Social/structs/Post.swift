//
//  Post.swift
//  Basic Social
//
//  Created by Jacob on 7/22/24.
//

import Foundation

struct Post: Decodable, Identifiable {
    var id: Int
    var title: String
    var body: String
    var tags: [String]
    var reactions: Reactions
    var views: Int
    var userId: Int
    var liked: Bool = false
    var disliked: Bool = false
}
