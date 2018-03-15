//
//  TabBarController.swift
//  WBooks
//
//  Created by Florencia Rosental on 13/03/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import UIKit

final internal class TabBarController: UITabBarController {

    init() {
        super.init(nibName: .none, bundle: .none)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
}

private extension TabBarController {
    
    func configure() {
        let libraryTab = UINavigationController(rootViewController: LibraryViewController())
        libraryTab.title = "tabBar.libraryTitle".localized()
        libraryTab.tabBarItem.image = UIImage(named: "ic_library")!
        
        let wishlistTab = UINavigationController(rootViewController: WishlistViewController())
        wishlistTab.title = "tabBar.wishlistTitle".localized()
        wishlistTab.tabBarItem.image = UIImage(named: "ic_wishlist")!
        
        let suggestTab = UINavigationController(rootViewController: SuggestViewController())
        suggestTab.title = "tabBar.suggestTitle".localized()
        suggestTab.tabBarItem.image = UIImage(named: "ic_add new")!
        
        let rentalsTab = UINavigationController(rootViewController: RentalsViewController())
        rentalsTab.title = "tabBar.rentalsTitle".localized()
        rentalsTab.tabBarItem.image = UIImage(named: "ic_myrentals")!
        
        viewControllers = [libraryTab, wishlistTab, suggestTab, rentalsTab]
    }
    
}
