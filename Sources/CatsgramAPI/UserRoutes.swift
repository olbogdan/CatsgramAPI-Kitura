//
//  UserRoutes.swift
//  CatsgramAPI
//
//  Created by Oleksndr Bogdanov on 02.11.21.
//

import Foundation
import Kitura

var users: [UserAuthentication] = []

func initializeUserRoutes(router: Router) {
    router.get("/api/v1/user", handler: getUser)
    router.post("/api/v1/user", handler: addUser)
}

func addUser(user: UserAuthentication, completion: @escaping (UserAuthentication?, RequestError?) -> Void) {
    users.append(user)
    completion(user, nil)
}

func getUser(query: UserParams, completion: @escaping (UserAuthentication?, RequestError?) -> Void) {
    guard let foundUser = users.first(where: { $0.id == query.id }),
          foundUser.password == query.password
    else {
        completion(nil, RequestError.unauthorized)
        return
    }
    completion(foundUser, nil)
}
