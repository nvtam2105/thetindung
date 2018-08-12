//
//  BaseCell.swift
//  thetindung
//
//  Created by Tam Nguyen on 8/13/18.
//  Copyright © 2018 Tam Nguyen. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {}
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
