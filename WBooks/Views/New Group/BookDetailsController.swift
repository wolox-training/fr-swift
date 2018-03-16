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
    fileprivate let _bookCommentsListViewModel = BookCommentsListViewModel()
    
    var bookViewModel: BookViewModel? = .none
    
    override func loadView() {
        view = _view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadDataFromViewModel()
        setUpNavigationBar()
        getCommentsFromBook(bookId: (bookViewModel?.id)!)
        setUpCommentBinding()
        setUpTable()
        
    }
}

// MARK: - UITableViewDelegate & UITableViewDataSource
extension BookDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return _bookCommentsListViewModel.bookComments.value.count
      
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = _view.bookCommentsTable.dequeue(cell: BookCommentCellView.self, for: indexPath)!
        
        let bookCommentViewModel = _bookCommentsListViewModel.bookComments.value[indexPath.row]
        cell.bind(viewModel: bookCommentViewModel)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Cell selected")
    }
    
}

// MARK: - Private Methods
fileprivate extension BookDetailsViewController {
    
    func setUpNavigationBar() {
        title = "bookDetails.title".localized()
        navigationController?.navigationBar.topItem?.title = ""
    }
    
    func loadDataFromViewModel() {
        _view.titleLabel.text = bookViewModel?.title
        _view.authorLabel.text = bookViewModel?.author
        _view.yearLabel.text = bookViewModel?.year
        _view.genreLabel.text = bookViewModel?.genre
        
        bookViewModel?.downloadImage(closure: {
            self._view.frontCoverImage.image = $0
        })
    }
    
    func setUpTable() {
        _view.bookCommentsTable.register(cell: BookCommentCellView.self)
        
        _view.bookCommentsTable.delegate = self
        _view.bookCommentsTable.dataSource = self
        
    }
    
    func getCommentsFromBook(bookId: Int) {
        _bookCommentsListViewModel.fetchBookComments(bookId: bookId)
    }
    
    func setUpCommentBinding() {
        _bookCommentsListViewModel.bookComments.signal.observeValues { [unowned self] _ in
            self._view.bookCommentsTable.reloadData()
        }
    }

}
