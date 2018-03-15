//
//  UIColorExtensions.swift
//  WBooks
//
//  Created by Florencia Rosental on 06/03/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    static func getLightBlue() -> UIColor {
        return UIColor(hex: "#C6F5FF")!
    }
    
    static func getAddToWishlistButtonLightBlueColor() -> UIColor {
        return UIColor(red:0/255, green:173/255, blue:238/255, alpha: 1)
    }
    
    static func getRentButtonGreyColor() -> UIColor {
        return UIColor(red:0.79, green:0.79, blue:0.79, alpha:1)
    }
}
