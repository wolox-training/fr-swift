//
//  BookCommentsListViewModel.swift
//  WBooks
//
//  Created by Florencia Rosental on 16/03/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import ReactiveSwift
import enum Result.NoError

internal final class BookCommentsListViewModel {
    
    let bookComments = MutableProperty<[BookCommentViewModel]>([])

    private let _bookCommentRepository: BookCommentsRepositoryType
    
    init(libraryRepository: BookCommentsRepositoryType = RepositoryManager.shared.createBookCommentsRepository()) {
        _bookCommentRepository = libraryRepository
    }
    
    func fetchBookComments(bookId: Int) {
        _bookCommentRepository.fetchBookComments(bookId: bookId).startWithResult { [unowned self] result in
            switch result {
            case .success(let value):
                self.bookComments.value = value.map { BookCommentViewModel(bookComment: $0) }
            case .failure(let error):
                print(error)
            }
        }
    }
}
