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
    let title: String
    let author: String
    let imageURL: String?
    
    init(id: Int, genre: String, title: String, author: String, imageURL: String?) {
        self.id = id
        self.genre = genre
        self.title =  title
        self.author = author
        self.imageURL = imageURL
    }
}

extension Book: Argo.Decodable {
    
    public static func decode(_ json: JSON) -> Decoded<Book> {
        return curry(Book.init)
            <^> json <| "id"
            <*> json <| "genre"
            <*> json <| "title"
            <*> json <| "author"
            <*> json <|? "image_url"
    }
    
}
