//
//  BookCellView.swift
//  WBooks
//
//  Created by Florencia Rosental on 06/03/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import Core

class BookCellView: UITableViewCell, NibLoadable {
    
    @IBOutlet weak var frontCover: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var author: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 25
    }
}

// MARK: - Private Methods
fileprivate extension BookCellView {
    
}
