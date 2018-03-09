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
    
    fileprivate lazy var _myView: BibliotecaView = BibliotecaView.loadFromNib()!
    fileprivate let _sessionManager = SessionManager()
    fileprivate let _viewModel = BibliotecaViewModel()
    
    override func loadView() {
        view = _myView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTable()
        setUpNavigationBar()
        setupBindings()
        
        createRepositories()
    }
 
    func createRepositories() {
        let repository = BibliotecaRepository(
            networkingConfiguration: RepositoryManager.shared.networkingConfiguration,
            sessionManager: _sessionManager)
    }
}

// MARK: - UITableViewDelegate & UITableViewDataSource
extension BibliotecaViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _viewModel.books.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = _myView.booksTable.dequeueReusableCell(withIdentifier: "BookCellView") as? BookCellView {
            cell.title.text = _viewModel.books.value[indexPath.row].title
            cell.author.text = _viewModel.books.value[indexPath.row].author
            
            var catPictureURL = URL(string: "http://www.freeiconspng.com/uploads/no-image-icon-1.jpg")!
            
            if _viewModel.books.value[indexPath.row].imageURL != .none{
                catPictureURL = URL(string: _viewModel.books.value[indexPath.row].imageURL!)!
            }
            
            // Creating a session object with the default configuration.
            let session = URLSession(configuration: .default)
            
            // Define a download task. The download task will download the contents of the URL as a Data object.
            let downloadPicTask = session.dataTask(with: catPictureURL) { (data, response, error) in
                // The download has finished.
                if let e = error {
                    print("Error downloading picture: \(e)")
                } else {
                    // No errors found.
                    if let res = response as? HTTPURLResponse {
                        if let imageData = data {
                            // Converts that Data into an image.
                            cell.frontCover.image = UIImage(data: imageData)
                        }
                    } else {
                        print("Couldn't get response code for some reason")
                    }
                }
            }
            
            downloadPicTask.resume()
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.row)!")
    }
}

// MARK: - Private Methods
fileprivate extension BibliotecaViewController {
    
    func setUpTable() {
        _myView.booksTable.register(UINib(nibName: "BookCellView", bundle: nil), forCellReuseIdentifier: "BookCellView")
        _myView.booksTable.backgroundColor = .getLightBlue()
        
        _myView.booksTable.delegate = self
        _myView.booksTable.dataSource = self
    }
    
    func setUpNavigationBar() {
        let rightButton = UIBarButtonItem(image: UIImage(named: "ic_search")!, style: .done, target: self, action: #selector(rightButtonHandler(sender:)))
        rightButton.tintColor = .white
        let leftButton = UIBarButtonItem(image: UIImage(named: "ic_notifications")!, style: .done, target: self, action: #selector(leftButtonHandler(sender:)))
        leftButton.tintColor = .white
        navigationItem.rightBarButtonItem = rightButton
        navigationItem.leftBarButtonItem = leftButton
        title = "Library"
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        //Sets the navigation bar invisible
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
    }
    
    func setupBindings() {
        _viewModel.books.signal.observeValues { [unowned self] _ in
            self._myView.booksTable.reloadData()
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
