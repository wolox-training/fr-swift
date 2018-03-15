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
    
    let books: Property<[BookViewModel]>
    
    private let _libraryRepository: LibraryRepositoryType
    
    init(libraryRepository: LibraryRepositoryType = RepositoryManager.shared.createLibraryRepository()) {
        _libraryRepository = libraryRepository
        
        let fetchBookProducer: SignalProducer<[BookViewModel], NoError> = _libraryRepository.fetchBooks()
            .map { $0.map { BookViewModel(book: $0) } }
            .liftError()
        
        books = Property<[BookViewModel]>(initial: [], then: fetchBookProducer)
    }
    
}
