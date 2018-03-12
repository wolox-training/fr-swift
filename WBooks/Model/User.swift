//
//  User.swift
//  WBooks
//
//  Created by Florencia Rosental on 07/03/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Networking
import Argo
import Curry
import Runes

struct User: AuthenticableUser {
    
    let sessionToken: String?
    let id: Int
    
}

extension User: Argo.Decodable {
    
    public static func decode(_ json: JSON) -> Decoded<User> {
        return curry(User.init)
            <^> json <|? "session_token"
            <*> json <| "id"
    }
    
}
