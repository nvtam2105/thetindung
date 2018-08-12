//
//  HomeController.swift
//  audible
//
//  Created by Brian Voong on 10/3/16.
//  Copyright © 2016 Lets Build That App. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Firebase

class HomeController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "We're logged in"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .plain, target: self, action: #selector(handleSignOut))
        
//        let imageView = UIImageView(image: UIImage(named: "home"))
//        view.addSubview(imageView)
//        _ = imageView.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 64, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
    @objc func handleSignOut() {
        do {
            print("Successfully logged out with our user: ", Auth.auth().currentUser ?? "")
            try Auth.auth().signOut()
            UserDefaults.standard.setIsLoggedIn(value: false)
            let loginController = LoginController()
            present(loginController, animated: true, completion: nil)
        } catch let error {
            // handle error here
            print("Error trying to sign out of Firebase: \(error.localizedDescription)")
        }
    }
    
}
