//
//  BookCellView.swift
//  WBooks
//
//  Created by Florencia Rosental on 06/03/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import Core

final internal class BookCellView: UITableViewCell, NibLoadable {
    
    static let Height: CGFloat = 113.0
    
    @IBOutlet weak var frontCoverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
}

internal extension BookCellView {
    
    func bind(viewModel: BookViewModel) {
        titleLabel.text = viewModel.title
        authorLabel.text = viewModel.author
        viewModel.downloadImage(closure: {
            self.frontCoverImageView.image = $0
        })
    }
}
