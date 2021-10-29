//
//  PostRoutes.swift
//  CHTTPParser
//
//  Created by Oleksndr Bogdanov on 29.10.21.
//
import Foundation
import Kitura
import KituraContracts

var posts: [Post] = [Post(id: UUID(), caption: "Caption \(index)", createdAt: Date(), createdBy: "User \(index)"),
                     Post(id: UUID(), caption: "Caption \(index)", createdAt: Date(), createdBy: "User \(index)"),
                     Post(id: UUID(), caption: "Caption \(index)", createdAt: Date(), createdBy: "User \(index)")]

@available(macOS 10.12, *)
func initializePostRoutes(router: Router) {
    router.get("/api/v1/posts", handler: getPosts)
    router.decoders[.json] = iso8001Decoder
    router.encoders[.json] = iso8601Encoder
}

func getPosts(completion: @escaping ([Post]?, RequestError?) -> Void) {
    completion(posts, nil)
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
