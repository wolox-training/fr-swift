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
        
        setCornerRadius()
    }
}

// MARK: - Private Methods
fileprivate extension BookCellView {
    
    func setCornerRadius(){
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 25
    }
}
