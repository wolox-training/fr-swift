//
//  BibliotecaViewController.swift
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

final class BibliotecaViewController: UIViewController {

    var books: [String] = ["We", "Heart", "Swift"]
    
    fileprivate lazy var _myView: BibliotecaView = BibliotecaView.loadFromNib()!
    fileprivate let _sessionManager = SessionManager()
//    fileprivate let _viewModel = BibliotecaViewModel()
    
    override func loadView() {
        view = _myView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTable()
        
        let rightButton = UIBarButtonItem(image: UIImage(named: "ic_search_placeholder")!, style: .done, target: self, action: #selector(rightButtonHandler(sender:)))
        navigationItem.rightBarButtonItem = rightButton
        
        title = "Library"
        
        setupBindings()
    }
    
    func setupBindings() {
//        _viewModel.books.signal.obserValues {
////            Crear la tabla
////            table.reloadData()
//        }
    }
    
    @objc
    func rightButtonHandler(sender: UIBarButtonItem) {
        
    }
 
//    func createRepositories() {
//        let repository = BibliotecaRepository(
//            networkingConfiguration: networkingConfiguration,
//            sessionManager: _sessionManager)
//    }
}

// MARK: - UITableViewDelegate & UITableViewDataSource
extension BibliotecaViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = _myView.booksTable.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = self.books[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.row)!")
    }
    
}

// MARK: - Private Methods
fileprivate extension BibliotecaViewController {
    
    func setupTable() {
        _myView.booksTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        _myView.booksTable.delegate = self
        _myView.booksTable.dataSource = self
    }
    
}
