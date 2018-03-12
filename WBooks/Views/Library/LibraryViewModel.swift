//
//  LibraryViewModel.swift
//  WBooks
//
//  Created by Florencia Rosental on 05/03/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import ReactiveSwift
import enum Result.NoError

class LibraryViewModel {
    fileprivate let _biblioRepo: LibraryRepositoryType
    let books = MutableProperty<[Book]>([])
    
    init(biblioRepo: LibraryRepositoryType = RepositoryManager.shared.createLibraryRepository()) {
        _biblioRepo = biblioRepo
        
        fetchBooks()
    }
    
    func fetchBooks() {
        _biblioRepo.fetchBooks().startWithResult { [unowned self] result in
            switch result {
            case .success(let value):
                self.books.value = value
            case .failure(let error):
                print(error)
            }
        }
    }
}
