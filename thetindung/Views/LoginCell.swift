//
//  LoginCell.swift
//  audible
//
//  Created by Brian Voong on 9/17/16.
//  Copyright © 2016 Lets Build That App. All rights reserved.
//

import UIKit

class LoginCell: BaseCell {
    
//    let logoImageView: UIImageView = {
//        let image = UIImage(named: "logo")
//        let imageView = UIImageView(image: image)
//        return imageView
//    }()
//
//    let emailTextField: LeftPaddedTextField = {
//        let textField = LeftPaddedTextField()
//        textField.placeholder = "Enter email"
//        textField.layer.borderColor = UIColor.lightGray.cgColor
//        textField.layer.borderWidth = 1
//        textField.keyboardType = .emailAddress
//        return textField
//    }()
//
//    let passwordTextField: LeftPaddedTextField = {
//        let textField = LeftPaddedTextField()
//        textField.placeholder = "Enter password"
//        textField.layer.borderColor = UIColor.lightGray.cgColor
//        textField.layer.borderWidth = 1
//        textField.isSecureTextEntry = true
//        return textField
//    }()
//
//    lazy var loginButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.backgroundColor = .orange
//        button.setTitle("Log in", for: .normal)
//        button.setTitleColor(.white, for: .normal)
//        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
//        return button
//    }()
    
    
    lazy var loginFB: UIButton = {
        let customFBButton = UIButton(type: .system)
        customFBButton.backgroundColor = .blue
        customFBButton.setTitle("Custom FB Login here", for: .normal)
        customFBButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        customFBButton.setTitleColor(.white, for: .normal)
        customFBButton.addTarget(self, action: #selector(handleCustomFBLogin), for: .touchUpInside)
        return customFBButton
        
    }()
    
    
    
    weak var delegate: LoginControllerDelegate?
    
    @objc func handleLogin() {
        delegate?.finishLoggingIn()
    }
    @objc func handleCustomFBLogin() {
        delegate?.handleCustomFBLogin()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        addSubview(logoImageView)
//        addSubview(emailTextField)
//        addSubview(passwordTextField)
//        addSubview(loginButton)
        addSubview(loginFB)
        
//        _ = logoImageView.anchor(centerYAnchor, left: nil, bottom: nil, right: nil, topConstant: -230, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 160, heightConstant: 160)
//        logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
//
//        _ = emailTextField.anchor(logoImageView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 8, leftConstant: 32, bottomConstant: 0, rightConstant: 32, widthConstant: 0, heightConstant: 50)
//
//        _ = passwordTextField.anchor(emailTextField.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 32, bottomConstant: 0, rightConstant: 32, widthConstant: 0, heightConstant: 50)
//
//        _ = loginButton.anchor(passwordTextField.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 32, bottomConstant: 0, rightConstant: 32, widthConstant: 0, heightConstant: 50)
        
        _ = loginFB.anchor(centerYAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 32, bottomConstant: 0, rightConstant: 32, widthConstant: 0, heightConstant: 50)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class LeftPaddedTextField: UITextField {
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
    }
    
}








