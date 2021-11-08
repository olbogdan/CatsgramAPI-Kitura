//
//  Like.swift
//  Catsgram
//
//  Created by Oleksndr Bogdanov on 07.11.21.
//

import Foundation
import KituraContracts

struct Like: Codable {
    var id: UUID?
    var postId: UUID
    var cratedByUser: String
    var cratedAt: Date

    internal init(id: UUID? = nil, postId: UUID, cratedByUser: String = currentUser?.id ?? "", cratedAt: Date = Date()) {
        self.id = id
        self.postId = postId
        self.cratedByUser = cratedByUser
        self.cratedAt = cratedAt
    }
}

struct LikeParams: QueryParams {
    var postId: String
    var createdByUser: String
}
