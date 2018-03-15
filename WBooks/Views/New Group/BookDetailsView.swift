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
    
    override func awakeFromNib() {
        addToWishlistButton.layer.borderColor = UIColor.getAddToWishlistButtonLightBlueColor().cgColor
        rentButton.backgroundColor = .getRentButtonGreyColor()
    }
}
