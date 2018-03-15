//
//  BookDetailsView.swift
//  WBooks
//
//  Created by Florencia Rosental on 14/03/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import Core

class BookDetailsView: UIView, NibLoadable {

    @IBOutlet weak var addToWishlistButton: UIButton!
    @IBOutlet weak var rentButton: UIButton!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var availableLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    
    @IBOutlet weak var frontCoverImage: UIImageView!
    
    override func awakeFromNib() {
        addToWishlistButton.layer.borderColor = UIColor.getAddToWishlistButtonLightBlueColor().cgColor
        rentButton.backgroundColor = .getRentButtonGreyColor()
    }
}
