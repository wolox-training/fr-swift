//
//  LoginViewController.swift
//  WBooks
//
//  Created by Guido Marucci Blas on 4/3/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import UIKit
import Core
import GoogleSignIn
import Networking

final class LoginViewController: UIViewController, GIDSignInUIDelegate {

    fileprivate lazy var _myView: LoginView = LoginView.loadFromNib()!
    fileprivate let _sessionManager = SessionManager()
    
    override func loadView() {
        view = _myView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Sets the LogIn and LogOut buttons
        _myView.logInButton.addTarget(self, action: #selector(logInClick(sender:)), for: .touchUpInside)
        _myView.logOutButton.addTarget(self, action: #selector(logOutClick(sender:)), for: .touchUpInside)
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        
        // Automatically signs in the user, if there is a user already authenticated.
        if GIDSignIn.sharedInstance().hasAuthInKeychain(){
            GIDSignIn.sharedInstance().signInSilently()
        }
        
        _myView.statusText.text = "Initialized Swift app..."
        changeUI(forLoggedIn: GIDSignIn.sharedInstance().hasAuthInKeychain())
    }
    
    @objc
    func logInClick(sender: UIButton) {
        _myView.statusText.text = "Logging..."
        GIDSignIn.sharedInstance().signIn()
        
    }
    
    @objc
    func logOutClick(sender: AnyObject) {
        GIDSignIn.sharedInstance().signOut()
        _myView.statusText.text = "Signed out."
        changeUI(forLoggedIn: GIDSignIn.sharedInstance().hasAuthInKeychain())
    }
  
    //Defines which button has be to shown, depending if the user has to log in, of if it's already logged.
    func changeUI(forLoggedIn loggedIn: Bool) {
        _myView.logInButton.isHidden = loggedIn
        _myView.logOutButton.isHidden = !loggedIn
        _myView.statusText.text = loggedIn ? "Already logged in" : "Google Sign in\niOS Demo"
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
}

extension LoginViewController: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print("Couldn't log")
        } else {
            let bibliotecaController = BibliotecaViewController()
            let navController = UINavigationController(rootViewController: bibliotecaController)
            present(navController, animated: true, completion: .none)
        }
    }
}
