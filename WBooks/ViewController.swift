//
//  ViewController.swift
//  WBooks
//
//  Created by Guido Marucci Blas on 4/3/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import UIKit
import Core

final class ViewController: UIViewController {

    fileprivate lazy var _myView: View = View.loadFromNib()!
    
    override func loadView() {
        view = _myView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _myView.loginButton.addTarget(self, action: #selector(click(sender:)), for: .touchUpInside)
    }
    
    @objc
    func click(sender: UIButton) {
        print("click")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
}
