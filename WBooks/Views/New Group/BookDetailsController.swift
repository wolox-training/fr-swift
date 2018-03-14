//
//  BookDetailsController.swift
//  WBooks
//
//  Created by Florencia Rosental on 14/03/2018.
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
        
        setUpNavigationBar()
    }
}

// MARK: - Private Methods
fileprivate extension BookDetailsViewController {
    func setUpNavigationBar() {
        let leftButton = UIBarButtonItem(image: .back, style: .done, target: self, action: #selector(leftButtonHandler(sender:)))
        leftButton.tintColor = .white
        navigationItem.leftBarButtonItem = leftButton
        title = "bookDetails.title".localized()
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
//
//        //Sets the navigation bar invisible
//        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        navigationController?.navigationBar.shadowImage = UIImage()
//        navigationController?.navigationBar.isTranslucent = true
    }
    
    @objc
    func leftButtonHandler(sender: UIBarButtonItem) {
        //TODO
    }
}

