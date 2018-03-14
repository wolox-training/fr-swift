//
//  BookDetailsController.swift
//  WBooks
//
//  Created by Florencia Rosental on 13/03/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import UIKit
import Foundation

final class BookDetailsViewController: UIViewController {
    
    fileprivate lazy var _view: BookDetailsView = BookDetailsView.loadFromNib()!
    
    override func loadView() {
        view = _view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
   
}
