//
//  BookCommentsRepository.swift
//  WBooks
//
//  Created by Florencia Rosental on 16/03/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Networking
import Argo
import Result
import ReactiveSwift

protocol BookCommentsRepositoryType {
    
    func fetchBookComments(bookId: Int) -> SignalProducer<[BookComment], RepositoryError>
    
}

internal class BookCommentsRepository: AbstractRepository, BookCommentsRepositoryType {
    
    private static let EntitiesPath = "books"
    private static let PageKey = "page"
    
    private static let ReadPrefixPath = "users"
    private static let ReadSuffixPath = "notifications/read_all"
        
    public func fetchBookComments(bookId: Int) -> SignalProducer<[BookComment], RepositoryError> {
//        let path = BookCommentsRepository.EntitiesPath
        let path = "books/" + String(bookId) + "/comments"
        let parameters: [String: Any] = [:]
        return performRequest(method: .get, path: path, parameters: parameters) {
            decode($0).toResult()
        }
    }
}
