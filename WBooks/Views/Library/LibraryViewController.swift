//
//  LibraryViewController.swift
//  WBooks
//
//  Created by Florencia Rosental on 28/02/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import UIKit
import Core
import Foundation
import Networking
import AlamofireNetworkActivityIndicator
import AlamofireNetworkActivityLogger

final class LibraryViewController: UIViewController {
    
    fileprivate lazy var _view: LibraryView = LibraryView.loadFromNib()!
    fileprivate let _viewModel = LibraryViewModel()
    
    override func loadView() {
        view = _view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTable()
        setUpNavigationBar()
        setupBindings()
    }
}

// MARK: - UITableViewDelegate & UITableViewDataSource
extension LibraryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _viewModel.books.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = _view.booksTable.dequeue(cell: BookCellView.self, for: indexPath)!
        
        let bookViewModel = _viewModel.books.value[indexPath.row]
        cell.bind(viewModel: bookViewModel)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let bookViewModel = _viewModel.books.value[indexPath.row]
        let bookDetailsView = BookDetailsViewController()
        bookDetailsView.bookViewModel = bookViewModel
        navigationController!.pushViewController(bookDetailsView, animated: true)
    }
}

// MARK: - Private Methods
fileprivate extension LibraryViewController {
    func setUpTable() {
        _view.booksTable.register(cell: BookCellView.self)
        _view.booksTable.backgroundColor = .getLightBlue()
        
        _view.booksTable.delegate = self
        _view.booksTable.dataSource = self
        
        _view.booksTable.rowHeight = BookCellView.Height
    }
    
    func setUpNavigationBar() {
        let rightButton = UIBarButtonItem(image: .search, style: .done, target: self, action: #selector(rightButtonHandler(sender:)))
        let leftButton = UIBarButtonItem(image: .notifications, style: .done, target: self, action: #selector(leftButtonHandler(sender:)))
        navigationItem.rightBarButtonItem = rightButton
        navigationItem.leftBarButtonItem = leftButton
        title = "library.title".localized()
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        //Sets the navigation bar invisible
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.tintColor = .white

    }
    
    func setupBindings() {
        _viewModel.books.signal.observeValues { [unowned self] _ in
            self._view.booksTable.reloadData()
        }
    }
    
    @objc
    func rightButtonHandler(sender: UIBarButtonItem) {
        //TODO
    }
    
    @objc
    func leftButtonHandler(sender: UIBarButtonItem) {
        //TODO
    }
}
