//
//  ViewController.swift
//  WBooks
//
//  Created by Guido Marucci Blas on 4/3/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import UIKit
import Core
import GoogleSignIn

final class ViewController: UIViewController, GIDSignInUIDelegate {

    fileprivate lazy var _myView: View = View.loadFromNib()!
    
    override func loadView() {
        view = _myView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Sets the Login and LogOut buttons
        _myView.loginButton.addTarget(self, action: #selector(loginClick(sender:)), for: .touchUpInside)
        _myView.logOutButton.addTarget(self, action: #selector(logOutClick(sender:)), for: .touchUpInside)
        _myView.statusText.textAlignment = NSTextAlignment.center
         
        GIDSignIn.sharedInstance().uiDelegate = self
        
        // Automatically sign in the user.
        GIDSignIn.sharedInstance().signInSilently()
        
        // [START_EXCLUDE]
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(receiveToggleAuthUINotification(_:)),
                                               name: NSNotification.Name(rawValue: "ToggleAuthUINotification"),
                                               object: nil)
        _myView.statusText.text = "Initialized Swift app..."
        toggleAuthUI()
        // [END_EXCLUDE]
    }
    
    @objc
    func loginClick(sender: UIButton) {
        print("Login")
        GIDSignIn.sharedInstance().signIn()
    }
    
    // [START signout_tapped]
    @objc
    func logOutClick(sender: AnyObject) {
        GIDSignIn.sharedInstance().signOut()
        // [START_EXCLUDE silent]
        _myView.statusText.text = "Signed out."
        toggleAuthUI()
        // [END_EXCLUDE]
    }
  
    // [START toggle_auth]
    //Defines which button has be to shown, depending if the user has to log in, of if it's already logged.
    func toggleAuthUI() {
        if GIDSignIn.sharedInstance().hasAuthInKeychain() {
            // Signed in
            _myView.loginButton.isHidden = true
            _myView.logOutButton.isHidden = false
        } else {
            _myView.loginButton.isHidden = false
            _myView.logOutButton.isHidden = true
            _myView.statusText.text = "Google Sign in\niOS Demo"
        }
    }
    
    // [END toggle_auth]
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self,
                                                  name: NSNotification.Name(rawValue: "ToggleAuthUINotification"),
                                                  object: nil)
    }
    
    @objc func receiveToggleAuthUINotification(_ notification: NSNotification) {
        if notification.name.rawValue == "ToggleAuthUINotification" {
            self.toggleAuthUI()
            if notification.userInfo != nil {
                guard let userInfo = notification.userInfo as? [String:String] else { return }
                self._myView.statusText.text = userInfo["statusText"]!
                
                let bibliotecaController = BibliotecaController()
                self.navigationController?.pushViewController(bibliotecaController, animated: true)
            }
        }
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
}
