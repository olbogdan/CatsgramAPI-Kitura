//
//  PostRoutes.swift
//  CHTTPParser
//
//  Created by Oleksndr Bogdanov on 29.10.21.
//
import Foundation
import Kitura
import KituraContracts

var posts: [Post] = [
    Post(id: UUID(uuidString: "87F1A26A-5B48-40F4-9534-6FEB6EC67954"), caption: "Caption 1", createdAt: Date(), createdBy: "User 1"),
    Post(id: UUID(), caption: "Caption 2", createdAt: Date(), createdBy: "User 2"),
    Post(id: UUID(), caption: "Caption 3", createdAt: Date(), createdBy: "User 3")
]

var likes: [Like] = [
    Like(id: UUID(), postId: UUID(uuidString: "87F1A26A-5B48-40F4-9534-6FEB6EC67954")!, cratedByUser: "user 1", cratedAt: Date()),
    Like(id: UUID(), postId: UUID(uuidString: "87F1A26A-5B48-40F4-9534-6FEB6EC67954")!, cratedByUser: "user 2", cratedAt: Date())
]

@available(macOS 10.12, *)
func initializePostRoutes(router: Router) {
    router.get("/api/v1/posts", handler: getPosts)
    router.post("/api/v1/posts", handler: addPost)
    router.decoders[.json] = iso8001Decoder
    router.encoders[.json] = iso8601Encoder
}

func getPosts(completion: @escaping ([Post]?, RequestError?) -> Void) {
    let posts = posts.map { post -> Post in
        var post = post
        post.isLiked = likes.contains { like in
            like.postId == post.id
        }
        return post
    }
    completion(posts, nil)
}

func addPost(post: Post, completion: @escaping (Post?, RequestError?) -> Void) {
    var newPost = post
    if newPost.id == nil {
        newPost.id = UUID()
    }
    posts.append(newPost)
    completion(newPost, nil)
}

@available(macOS 10.12, *)
let iso8001Decoder: () -> BodyDecoder = {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .iso8601
    return decoder
}

@available(macOS 10.12, *)
let iso8601Encoder: () -> BodyEncoder = {
    let encoder = JSONEncoder()
    encoder.dateEncodingStrategy = .iso8601
    return encoder
}
