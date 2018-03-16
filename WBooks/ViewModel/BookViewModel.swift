//
//  BookViewModel.swift
//  WBooks
//
//  Created by Florencia Rosental on 13/03/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit

internal final class BookViewModel {
    
    private let _book: Book
    
    init(book: Book) {
        _book = book
    }
    
    var id: Int {
        return _book.id
    }
    
    var title: String {
        return _book.title
    }
    
    var author: String {
        return _book.author
    }
    
    var genre: String {
        return _book.genre
    }
    
    var year: String {
        return _book.year
    }
    
    var publisher: String {
        return _book.publisher
    }
    
    var description: String {
        return _book.description!
    }
    
    func downloadImage(closure: @escaping (UIImage) -> Void) {
        let imageString = _book.imageURL ?? "http://www.freeiconspng.com/uploads/no-image-icon-1.jpg"
        let imageURL = URL(string: imageString)!

        let session = URLSession(configuration: .default)
        session.dataTask(with: imageURL) { (data, response, error) in
            guard error == nil else {
                print("Error downloading picture: \(error)")
                return
            }
            guard response is HTTPURLResponse else {
                print("Couldn't get response code for some reason")
                return
            }
            guard let data = data else {
                print("Image downloaded is .none")
                return
            }
            
            closure(UIImage(data: data)!)
        }.resume()
    }
}
