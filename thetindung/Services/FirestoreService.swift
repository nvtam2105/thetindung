//
//  FirestoreService.swift
//  thetindung
//
//  Created by Tam Nguyen on 8/12/18.
//  Copyright © 2018 Tam Nguyen. All rights reserved.
//

import UIKit
import FirebaseFirestore

class FirestoreSerivce: NSObject {


    static let sharedInstance = FirestoreSerivce()

    var lastSnapshot: DocumentSnapshot? = nil
    var limit: Int = 1

//    // Construct query for first 25 cities, ordered by population
    func getCards() {
        let cardReference = Firestore.firestore().collection("cards")

        cardReference.addSnapshotListener { (snapshot, error) in

            guard let snapshot = snapshot else {
                print("Error retreving cards: \(error.debugDescription)")
                return
            }

            for document in snapshot.documents {
                print(document.data())
            }
        }
    }

    func loadData() {
        let db = Firestore.firestore()
        let collection = db.collection("cards")
        if lastSnapshot == nil { // first load
            let first = collection.limit(to: limit)
            first.getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    self.lastSnapshot = querySnapshot!.documents.last!
                    for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                    }
                    
                }
            }
        } else {
            let next = collection.start(afterDocument: self.lastSnapshot!).limit(to: limit)
            next.getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    self.lastSnapshot = querySnapshot!.documents.last!
                    for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                    }
                    
                }
            }
        }
    }
}
