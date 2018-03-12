//
//  LibraryRepository.swift
//  WBooks
//
//  Created by Florencia Rosental on 02/03/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Networking
import Argo
import Result
import ReactiveSwift

protocol LibraryRepositoryType {
    
    func fetchBooks() -> SignalProducer<[Book], RepositoryError>
    
}

internal class LibraryRepository: AbstractRepository, LibraryRepositoryType {
    
    private static let EntitiesPath = "books"
    private static let PageKey = "page"
    
    private static let ReadPrefixPath = "users"
    private static let ReadSuffixPath = "notifications/read_all"
    
    private static let FirstPage = 1
    
    public func fetchBooks() -> SignalProducer<[Book], RepositoryError> {
        let path = LibraryRepository.EntitiesPath
        let parameters: [String: Any] = [:]
        return performRequest(method: .get, path: path, parameters: parameters) {
            decode($0).toResult()
        }
    }    
}
