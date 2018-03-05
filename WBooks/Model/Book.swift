//
//  Book.swift
//  WBooks
//
//  Created by Florencia Rosental on 02/03/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Argo
import Curry
import Runes

public struct Book {
    
    let id: Int
    let genre: String
}

extension Book: Argo.Decodable {
    
    public static func decode(_ json: JSON) -> Decoded<Book> {
        return curry(Book.init)
            <^> json <| "id"
            <*> json <| "genre"
    }
    
}
