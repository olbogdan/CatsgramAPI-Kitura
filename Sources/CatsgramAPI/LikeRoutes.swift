//
//  LikeRoutes.swift
//  CatsgramAPI
//
//  Created by Oleksndr Bogdanov on 08.11.21.
//

import Foundation
import Kitura

var likes: [Like] = [
    Like(id: UUID(), postId: UUID(uuidString: "87F1A26A-5B48-40F4-9534-6FEB6EC67954")!, cratedByUser: "user 1", cratedAt: Date()),
    Like(id: UUID(), postId: UUID(uuidString: "87F1A26A-5B48-40F4-9534-6FEB6EC67954")!, cratedByUser: "user 2", cratedAt: Date())
]

func initializeLikeRoutes(router: Router) {
    router.post("/api/v1/likes", handler: addLike)
//    router.get("/api/v1/likes", handler: deletee)
}

func addLike(like: Like, completion: @escaping (Like?, RequestError?) -> Void) {
    likes.append(like)
    completion(like, nil)
}

func deleteLike(query: LikeParams, completion: @escaping (RequestError?) -> Void) {
    // TODO: check that executed by current user, query.user == auth.user
    let index = likes.firstIndex { _ in true }

    if let index = index {
        likes.remove(at: index)
    } else {
        completion(.forbidden)
    }
}
