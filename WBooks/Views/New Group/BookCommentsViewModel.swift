//
//  BookCommentsViewModel.swift
//  WBooks
//
//  Created by Florencia Rosental on 16/03/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import ReactiveSwift
import enum Result.NoError

internal final class BookCommentsListViewModel {
    
    let bookComments: Property<[BookCommentsListViewModel]>
    
    private let _bookCommentsRepository: BookCommentsRepositoryType
    
    init(bookCommentsRepository: BookCommentsRepositoryType = RepositoryManager.shared.createBookCommentsRepository()) {
        _bookCommentsRepository = bookCommentsRepository
        
        let fetchBookCommentsProducer: SignalProducer<[BookCommentsListViewModel], NoError> = _bookCommentsRepository.fetchBookComments()
            .map { $0.map { BookCommentsListViewModel(book: $0) } }
            .liftError()
        
        bookComments = Property<[BookCommentsListViewModel]>(initial: [], then: fetchBookCommentsProducer)
    }
    
}

