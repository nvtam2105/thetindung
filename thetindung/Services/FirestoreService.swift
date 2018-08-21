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
    
//
//    func fetchCards() {
//        let cardReference = Firestore.firestore().collection("cards")
//        cardReference.addSnapshotListener { (snapshot, error) in
//            guard let snapshot = snapshot else {
//                print("Error retreving cards: \(error.debugDescription)")
//                return
//            }
//            for document in snapshot.documents {
//                print(document.data())
//            }
//        }
//    }
    
    func fetchCards(_ completion: @escaping ([CreditCard]) -> ()) {
        let cardReference = Firestore.firestore().collection("cards")
        if self.lastSnapshot == nil {
            let first = cardReference.limit(to: limit)
            first.getModels(CreditCard.self) { (creditCards, lastSnapshot, err) in
                self.lastSnapshot = lastSnapshot
                completion(creditCards!)
            }
        } else {
            let next = cardReference.start(afterDocument: self.lastSnapshot!).limit(to: limit)
            next.getModels(CreditCard.self) { (creditCards, lastSnapshot, err)  in
                self.lastSnapshot = lastSnapshot
                completion(creditCards!)
                
            }
        }
        
    }
}
