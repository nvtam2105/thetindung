//
//  HomeController.swift
//  audible
//
//  Created by Brian Voong on 10/3/16.
//  Copyright © 2016 Lets Build That App. All rights reserved.
//

import UIKit
import Firebase

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var crediCards: [CreditCard] = {
        return FirestoreSerivce.sharedInstance.fetchCards()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Home"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .plain, target: self, action: #selector(handleSignOut))
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(CreditCardCell.self, forCellWithReuseIdentifier: "cellId")
        
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return crediCards.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! CreditCardCell
        cell.crediCard = crediCards[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height - 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
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
