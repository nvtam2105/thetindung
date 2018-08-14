//
//  CreditCard.swift
//  thetindung
//
//  Created by Tam Nguyen on 8/12/18.
//  Copyright © 2018 Tam Nguyen. All rights reserved.
//

import Foundation

struct CreditCard {
    
    let documentID: String!
    let type: String
    let bank: String
    let image: String
}

extension CreditCard: FirestoreModel {    
    
    init?(modelData: FirestoreModelData) {
        try? self.init(
            documentID: modelData.documentID,
            type: modelData.documentID,
            bank: modelData.value(forKey: "bank"),
            image: modelData.value(forKey: "image")
        )
    }
}
