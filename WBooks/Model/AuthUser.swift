//
//  AuthUser.swift
//  WBooks
//
//  Created by Florencia Rosental on 16/03/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Networking
import Argo
import Curry
import Runes

struct AuthUser: AuthenticableUser {
    
    let sessionToken: String?
    let id: Int
    
}

extension AuthUser: Argo.Decodable {
    
    public static func decode(_ json: JSON) -> Decoded<AuthUser> {
        return curry(AuthUser.init)
            <^> json <|? "session_token"
            <*> json <| "id"
    }
    
}
