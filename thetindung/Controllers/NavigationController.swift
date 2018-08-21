//
//  NavigationController.swift
//  audible
//
//  Created by Brian Voong on 9/27/16.
//  Copyright © 2016 Lets Build That App. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        if isLoggedIn() {
            //assume user is logged in
//            let layout = UICollectionViewFlowLayout()
//            let homeController = HomeController(collectionViewLayout: layout)
//            viewControllers = [homeController]
            let searchController = SearchController()
            viewControllers = [searchController]
        } else {
            perform(#selector(showLoginController), with: nil, afterDelay: 0.01)
        }
    }
    
    fileprivate func isLoggedIn() -> Bool {
        return UserDefaults.standard.isLoggedIn()
        //return true
    }
    
    @objc func showLoginController() {
        let loginController = LoginController()
        present(loginController, animated: true, completion: {
            //perhaps we'll do something here later
        })
    }
}






