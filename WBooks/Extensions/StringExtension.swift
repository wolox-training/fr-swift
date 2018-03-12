//
//  StringExtension.swift
//  WBooks
//
//  Created by Florencia Rosental on 05/03/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation

extension String {
    
    static func / (url: String, path: String) -> String {
        return (url as NSString).appendingPathComponent(path)
    }
    
}
