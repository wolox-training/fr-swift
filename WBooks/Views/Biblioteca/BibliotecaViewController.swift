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

final class BibliotecaViewController: UIViewController {
    
    fileprivate lazy var _myView: BibliotecaView = BibliotecaView.loadFromNib()!
    
    override func loadView() {
        view = _myView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rightButton = UIBarButtonItem(image: UIImage(named: "ic_search_placeholder")!, style: .done, target: self, action: #selector(rightButtonHandler(sender:)))
        navigationItem.rightBarButtonItem = rightButton
        
        title = "Library"
    }
    
    @objc
    func rightButtonHandler(sender: UIBarButtonItem) {
        
    }
    
}
