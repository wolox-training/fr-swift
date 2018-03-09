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
    
    init(biblioRepo: BibliotecaRepositoryType = RepositoryManager.shared.createBibliotecaRepository()) {
        _biblioRepo = biblioRepo
        
        fetchBooks()
    }
    
    func fetchBooks() {
        let a = _biblioRepo.fetchBooks()
        
        a.startWithResult { [unowned self] result in
            switch result {
            case .success(let value):
                self.books.value = value
            case .failure(let error):
                print(error)
            }
        }
        
        //Another way of doing this
        // books <~ _biblioRepo.fetchBooks().liftError()
    }

}
