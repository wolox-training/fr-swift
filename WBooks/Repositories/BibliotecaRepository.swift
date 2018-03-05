//
//  BibliotecaRepository.swift
//  WBooks
//
//  Created by Florencia Rosental on 02/03/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Networking
import Argo
import Result
import ReactiveSwift

protocol BibliotecaRepositoryType {
    
    func fetchBooks() -> SignalProducer<[Book], RepositoryError>
    
}

internal class BibliotecaRepository: AbstractRepository, BibliotecaRepositoryType {
    
    private static let EntitiesPath = "books"
    private static let PageKey = "page"
    
    private static let ReadPrefixPath = "users"
    private static let ReadSuffixPath = "notifications/read_all"
    
    private static let FirstPage = 1
    
    public func fetchBooks() -> SignalProducer<[Book], RepositoryError> {
        let path = BibliotecaRepository.EntitiesPath
        let parameters = [BibliotecaRepository.PageKey: BibliotecaRepository.FirstPage]
        return performRequest(method: .get, path: path, parameters: parameters) {
            decode($0).toResult()
        }
    }
    
    public func noAnswerEntities(userID: Int) -> SignalProducer<Void, RepositoryError> {
        let path = BibliotecaRepository.ReadPrefixPath / String(userID) / BibliotecaRepository.ReadSuffixPath
        return performRequest(method: .post, path: path) { _ in
            Result(value: ())
        }
    }
    
}
