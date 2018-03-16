//
//  BookComment.swift
//  WBooks
//
//  Created by Florencia Rosental on 16/03/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Argo
import Curry
import Runes

public struct BookComment {
    
    let id: Int
    let content: String
    let user: User
    
    init(id: Int, content: String, user: User) {
        self.id = id
        self.content = content
        self.user = user
    }
    
}

extension BookComment: Argo.Decodable {
    
    public static func decode(_ json: JSON) -> Decoded<BookComment> {
        return curry(BookComment.init)
            <^> json <| "id"
            <*> json <| "content"
            <*> json <| "user"
    }
    
}
