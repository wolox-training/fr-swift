//
//  BibliotecaController.swift
//  WBooks
//
//  Created by Florencia Rosental on 28/02/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//
import UIKit
import Core
import Foundation

final class BibliotecaController: UIViewController {
    
    fileprivate lazy var _myView: Biblioteca = Biblioteca.loadFromNib()!
    
    override func loadView() {
        view = _myView
    }
    
    
}
