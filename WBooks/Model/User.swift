//
//  User.swift
//  WBooks
//
//  Created by Florencia Rosental on 16/03/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Argo
import Curry
import Runes

public struct User {
    let id: Int
    let firstName: String
    let lastName: String
    let email: String
    let imageUrl: String?
    
    init(id: Int, firstName: String, lastName: String, email: String, imageUrl: String?) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.imageUrl = imageUrl
    }
    
}

extension User: Argo.Decodable {
    
    public static func decode(_ json: JSON) -> Decoded<User> {
        return curry(User.init)
            <^> json <| "id"
            <*> json <| "first_name"
            <*> json <| "last_name"
            <*> json <| "email"
            <*> json <|? "image_url"
    }
    
}
