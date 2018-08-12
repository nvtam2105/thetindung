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

//    // Construct query for first 25 cities, ordered by population
//    let first = Firestore.firestore().collection("cards").limit(to: 1)
//    
//    first.addSnapshotListener { (snapshot, error) in
//        guard let snapshot = snapshot else {
//            print("Error retreving cities: \(error.debugDescription)")
//            return
//        }
//
//        guard let lastSnapshot = snapshot.documents.last else {
//            // The collection is empty.
//            return
//        }
//
//        // Construct a new query starting after this document,
//        // retrieving the next 25 cities.
//        let next = db.collection("cards")
//        //.order(by: "population")
//        .start(afterDocument: lastSnapshot)
//
//        // Use the query for pagination.
//        // ...
//    }
}
