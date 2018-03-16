//
//  BookCommentViewModel.swift
//  WBooks
//
//  Created by Florencia Rosental on 16/03/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit

internal final class BookCommentViewModel {
    
    private let _bookComment: BookComment
    
    init(bookComment: BookComment) {
        _bookComment = bookComment
    }
    
    var id: Int {
        return _bookComment.id
    }
    
    var content: String{
        return _bookComment.content
    }
    
    var user: User{
        return _bookComment.user
    }
  
}
