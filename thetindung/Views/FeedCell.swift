//
//  FeedCell.swift
//  youtube
//
//  Created by Brian Voong on 7/3/16.
//  Copyright © 2016 letsbuildthatapp. All rights reserved.
//

import UIKit

class FeedCell: BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    var videos: [Video]?
    var creditCards: [CreditCard]?
    
    let cellId = "cellId"
    
    func fetchVideos() {
        ApiService.sharedInstance.fetchVideos { (videos: [Video]) in

            self.videos = videos
            self.collectionView.reloadData()

        }
    }
    
    func fetchCreditCards() {
        FirestoreSerivce.sharedInstance.fetchCards { (creditCards: [CreditCard]) in
            self.creditCards  = creditCards
            self.collectionView.reloadData()
            
        }
    }

    override func setupViews() {
        super.setupViews()
        
        //fetchVideos()
        
        fetchCreditCards()
        backgroundColor = .brown
        
        addSubview(collectionView)
        addConstraintsWithFormat("H:|[v0]|", views: collectionView)
        addConstraintsWithFormat("V:|[v0]|", views: collectionView)
        
        //collectionView.register(VideoCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView.register(CreditCardCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //print("count=", videos?.count ?? 0)
        //return videos?.count ?? 0
        
        print("count-creditCards=", creditCards?.count ?? 0)
        return creditCards?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! VideoCell
//
//        cell.video = videos?[indexPath.item]
//
//        return cell
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! CreditCardCell
        
        cell.creditCard = creditCards?[indexPath.item]
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (frame.width - 16 - 16) * 9 / 16
        return CGSize(width: frame.width, height: height + 16 + 88)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //let videoLauncher = VideoLauncher()
        //videoLauncher.showVideoPlayer()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // calculates where the user is in the y-axis
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if offsetY > contentHeight - scrollView.frame.size.height {
            // call your API for more data
           updateNextSet()
        }
    }
    
    func updateNextSet(){
        print("On Completetion")
        //requests another set of data (20 more items) from the server.
    }


}


















