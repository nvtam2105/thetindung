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
    
    var numOfItems = 2
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Home"

        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .plain, target: self, action: #selector(handleSignOut))

        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(CreditCardCell.self, forCellWithReuseIdentifier: "cellId")
        
        //FirestoreSerivce.sharedInstance.getCards()
        //FirestoreSerivce.sharedInstance.loadData()
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        cell.backgroundColor = UIColor.red
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == 1 {  //numberofitem count
            updateNextSet()
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 350)
    }
    
    func updateNextSet(){
        print("On Completetion")
        FirestoreSerivce.sharedInstance.loadData()
        //requests another set of data (20 more items) from the server.
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
