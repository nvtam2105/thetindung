//
//  SearchController.swift
//  thetindung
//
//  Created by tam on 8/18/18.
//  Copyright © 2018 Tam Nguyen. All rights reserved.
//

import UIKit
import SwiftyButton

class SearchController : UIViewController {
    
    var dropdownBtn = DropDownBtn()
    //var button = CustomPressableButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //Configure the button
        dropdownBtn = DropDownBtn.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        dropdownBtn.setTitle("Colors", for: .normal)
        dropdownBtn.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        //Add Button to the View Controller
        self.view.addSubview(dropdownBtn)
        
        //button Constraints
        dropdownBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        dropdownBtn.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        dropdownBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        dropdownBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        //Set the drop down menu's options
        dropdownBtn.dropView.dropDownOptions = ["Blue", "Green", "Magenta", "White", "Black", "Pink"]
        
        
        
//        let customButtonContainerView = UIView()
//        let button = CustomPressableButton()
//        button.translatesAutoresizingMaskIntoConstraints = false
//        customButtonContainerView.addSubview(button)
//        customButtonContainerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[button]|", metrics: nil, views: ["button": button]))
//        customButtonContainerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[button]|", metrics: nil, views: ["button": button]))
//        button.colors = .init(
//            button: UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1),
//            shadow: UIColor(red: 41/255, green: 128/255, blue: 185/255, alpha: 1)
//        )
//        //button.cornerRadius = 8
//
//
//        let indicator = UIActivityIndicatorView(activityIndicatorStyle: .white)
//        indicator.translatesAutoresizingMaskIntoConstraints = false
//        button.contentView.addSubview(indicator)
//        button.contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[indicator]-10-|", metrics: nil, views: ["indicator": indicator]))
//        indicator.startAnimating()
//
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        button.contentView.addSubview(label)
//        button.contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[label]-10-|", metrics: nil, views: ["label": label]))
//        button.contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-15-[indicator]-10-[label]-15-|", metrics: nil, views: ["indicator": indicator, "label": label]))
//        label.text = "Loading..."
//        label.textColor = UIColor.white
//
//        self.view.addSubview(button)
//
        
        let button = UIButton()
        button.frame = CGRect(x: self.view.frame.size.width - 60, y: 60, width: 100, height: 50)
        button.center = self.view.center
        button.backgroundColor = UIColor.red
        button.setTitle("Name your Button ", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(button)
        
      
        
    }
    
    
    @objc func buttonAction(sender: UIButton!) {
        print("Button tapped")
        let layout = UICollectionViewFlowLayout()
        let homeController = HomeController(collectionViewLayout: layout)
        self.navigationController?.pushViewController(homeController, animated: true)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
