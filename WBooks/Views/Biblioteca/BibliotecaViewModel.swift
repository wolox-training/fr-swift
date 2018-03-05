//
//  BibliotecaViewModel.swift
//  WBooks
//
//  Created by Florencia Rosental on 05/03/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import ReactiveSwift
import enum Result.NoError

class BibliotecaViewModel {
    fileprivate let _biblioRepo: BibliotecaRepositoryType
    let books = MutableProperty<[Book]>([])
    
    init(biblioRepo: BibliotecaRepositoryType = RepositoryManager.shared.createBibliotecaRepo()) {
        _biblioRepo = biblioRepo
        
        fetchBooks()
    }
    
    func fetchBooks() {
//        _biblioRepo.fetchBooks().startValues { [unowned self] books in
//            self.books.value = books
//        }
        
        books <~ _biblioRepo.fetchBooks().liftError()
    }

}
