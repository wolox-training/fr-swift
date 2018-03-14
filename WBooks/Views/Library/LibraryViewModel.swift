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

internal final class LibraryViewModel {
    
    private let _libraryRepository: LibraryRepositoryType
    let books = MutableProperty<[BookViewModel]>([])
    
    init(libraryRepository: LibraryRepositoryType = RepositoryManager.shared.createLibraryRepository()) {
        _libraryRepository = libraryRepository
        fetchBooks()
    }
    
    func fetchBooks() {
        _libraryRepository.fetchBooks().startWithResult { [unowned self] result in
            switch result {
            case .success(let value):
                self.books.value = value.map { BookViewModel(book: $0) }
            case .failure(let error):
                print(error)
            }
        }
    }
}
