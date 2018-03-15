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
    var bookViewModel: BookViewModel? = nil
    
    override func loadView() {
        view = _view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadDataFromViewModel()
        setUpNavigationBar()
    }
}

// MARK: - Private Methods
fileprivate extension BookDetailsViewController {
    func setUpNavigationBar() {
        title = "bookDetails.title".localized()
        navigationController?.navigationBar.topItem?.title = ""
    }
    
    func loadDataFromViewModel(){
        _view.titleLabel.text = bookViewModel?.title
        _view.authorLabel.text = bookViewModel?.author
        _view.yearLabel.text = bookViewModel?.year
        _view.genreLabel.text = bookViewModel?.genre
        
        bookViewModel?.downloadImage(closure: {
            self._view.frontCoverImage.image = $0
        })
    }
}

