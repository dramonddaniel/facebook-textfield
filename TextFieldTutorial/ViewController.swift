//
//  ViewController.swift
//  TextFieldTutorial
//
//  Created by Daniel Dramond on 23/10/2017.
//  Copyright © 2017 Dramond. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.customGreen()
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        self.handleSetupKeyboardObservers()
        
        setupViews()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func handleSetupKeyboardObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillShow), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillHide), name: .UIKeyboardWillHide, object: nil)
    }
    
    @objc func handleKeyboardWillShow(notification: NSNotification) {
        let keyboardFrame = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as AnyObject).cgRectValue
        let keyboardDuration = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey]
        
        guard let keyboardHeight: CGFloat = keyboardFrame?.height else { return }
        let height: CGFloat = keyboardHeight + 24 + 50 + 24
        
        textFieldHeightConstraint?.constant = containerHeight - 24
        textFieldCenterYConstraint?.isActive = false
        
        textFieldBottomConstraint?.isActive = true
        textFieldBottomConstraint?.constant = -height
        
        passwordTopConstraint?.constant = 12
        usernameTopConstraint?.constant = 12
        
        UIView.animate(withDuration: keyboardDuration as! TimeInterval) { self.view.layoutIfNeeded() }
    }
    
    @objc func handleKeyboardWillHide(notification: NSNotification) {
        let keyboardDuration = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey]
        
        textFieldHeightConstraint?.constant = containerHeight
        textFieldCenterYConstraint?.isActive = true
        
        textFieldBottomConstraint?.isActive = false
        textFieldBottomConstraint?.constant = 0
        
        passwordTopConstraint?.constant = 24
        usernameTopConstraint?.constant = 24
        
        UIView.animate(withDuration: keyboardDuration as! TimeInterval) { self.view.layoutIfNeeded() }
    }
    
    let textfieldContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    // MARK: - EMAIL
    
    let emailContainer: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 27
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 4
        view.backgroundColor = UIColor.customGreen()
        return view
    }()
    
    let emailTextField: UITextField = {
        let tv = UITextField()
        tv.placeholder = "Email"
        tv.textColor = .white
        tv.tintColor = .white
        tv.font = UIFont(name: "AvenirNext-Medium", size: 17)
        tv.backgroundColor = UIColor.customGreen()
        tv.autocorrectionType = .no
        return tv
    }()
    
    // MARK: - PASSWORD
    
    let passwordContainer: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 27
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 4
        view.backgroundColor = UIColor.customGreen()
        return view
    }()
    
    let passwordTextField: UITextField = {
        let tv = UITextField()
        tv.placeholder = "Password"
        tv.textColor = .white
        tv.tintColor = .white
        tv.font = UIFont(name: "AvenirNext-Medium", size: 17)
        tv.backgroundColor = UIColor.customGreen()
        tv.autocorrectionType = .no
        return tv
    }()
    
    // MARK: - USERNAME
    
    let usernameContainer: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 27
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 4
        view.backgroundColor = UIColor.customGreen()
        return view
    }()
    
    let usernameTextField: UITextField = {
        let tv = UITextField()
        tv.placeholder = "Username"
        tv.textColor = .white
        tv.tintColor = .white
        tv.font = UIFont(name: "AvenirNext-Medium", size: 17)
        tv.backgroundColor = UIColor.customGreen()
        tv.autocorrectionType = .no
        return tv
    }()
    
    // MARK: SIGN UP
    
    lazy var signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.textAlignment = .center
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "AvenirNext-DemiBold", size: 20)
        button.backgroundColor = UIColor.customPink()
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 25
        return button
    }()
    
    var textFieldCenterYConstraint: NSLayoutConstraint?
    var textFieldHeightConstraint: NSLayoutConstraint?
    var textFieldBottomConstraint: NSLayoutConstraint?
    
    var passwordTopConstraint: NSLayoutConstraint?
    var usernameTopConstraint: NSLayoutConstraint?
    
    var containerHeight: CGFloat = 210
    
    func setupViews() {
        view.addSubview(textfieldContainer)
        _ = textfieldContainer.anchor(nil, left: nil, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: view.frame.width * 0.8, heightConstant: 0)
        
        textFieldBottomConstraint = textfieldContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        textFieldBottomConstraint?.isActive = false
        
        textFieldHeightConstraint = textfieldContainer.heightAnchor.constraint(equalToConstant: containerHeight)
        textFieldHeightConstraint?.isActive = true
        
        textfieldContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textFieldCenterYConstraint = textfieldContainer.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        textFieldCenterYConstraint?.isActive = true
        
        // MARK: EMAIL CONSTRAINTS
        
        textfieldContainer.addSubview(emailContainer)
        _ = emailContainer.anchor(textfieldContainer.topAnchor, left: textfieldContainer.leftAnchor, bottom: nil, right: textfieldContainer.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 54)
        
        emailContainer.addSubview(emailTextField)
        _ = emailTextField.anchor(emailContainer.topAnchor, left: emailContainer.leftAnchor, bottom: emailContainer.bottomAnchor, right: emailContainer.rightAnchor, topConstant: 0, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        // MARK: PASSWORD CONSTRAINTS
        
        textfieldContainer.addSubview(passwordContainer)
        passwordTopConstraint = passwordContainer.anchor(emailContainer.bottomAnchor, left: textfieldContainer.leftAnchor, bottom: nil, right: textfieldContainer.rightAnchor, topConstant: 24, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 54)[0]
        
        passwordContainer.addSubview(passwordTextField)
        _ = passwordTextField.anchor(passwordContainer.topAnchor, left: passwordContainer.leftAnchor, bottom: passwordContainer.bottomAnchor, right: passwordContainer.rightAnchor, topConstant: 0, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        // MARK: - USERNAME CONSTRAINTS
        
        textfieldContainer.addSubview(usernameContainer)
        usernameTopConstraint = usernameContainer.anchor(passwordContainer.bottomAnchor, left: textfieldContainer.leftAnchor, bottom: nil, right: textfieldContainer.rightAnchor, topConstant: 24, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 54)[0]
        
        usernameContainer.addSubview(usernameTextField)
        _ = usernameTextField.anchor(usernameContainer.topAnchor, left: usernameContainer.leftAnchor, bottom: usernameContainer.bottomAnchor, right: usernameContainer.rightAnchor, topConstant: 0, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        view.addSubview(signUpButton)
        _ = signUpButton.anchor(textfieldContainer.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 24, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 120, heightConstant: 50)
        signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

}

