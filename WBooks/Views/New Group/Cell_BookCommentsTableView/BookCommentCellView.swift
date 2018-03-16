//
//  BookCommentView.swift
//  WBooks
//
//  Created by Florencia Rosental on 16/03/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import Core

final internal class BookCommentCellView: UITableViewCell, NibLoadable {
    
    static let Height: CGFloat = 113.0
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
}

internal extension BookCommentCellView {
    
    func bind(viewModel: BookCommentViewModel) {
        userNameLabel.text = viewModel.user.firstName + " " + viewModel.user.lastName
        commentLabel.text = viewModel.content
        //TODO: userImage
    }
}

