//
//  RegisterViewController.swift
//  Dropquick
//
//  Created by Sung Jae Min on 8/6/17.
//  Copyright © 2017 Dropquick. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate{
    
    fileprivate let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email:"
        label.textColor = .white
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate let emailTextField: LeftPaddedTextField = {
        
        let textField = LeftPaddedTextField()
        
        textField.placeholder = "Enter email"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 5
        textField.layer.masksToBounds = true
        textField.layer.borderWidth = 1
        textField.keyboardType = .emailAddress
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    fileprivate let backButton: UIButton = {
        let button = UIButton(type: .system)
        let buttonColor = UIColor.init(colorWithHexValue: 0x555555, alpha: 1.0)
        
        //let registerViewController = RegisterViewController()
        
        button.backgroundColor = buttonColor
        button.setTitle("BACK", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel!.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(actionBackButton), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        let registerView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
        
        setupView(currentView: registerView)
        addSubview(currentView: registerView)
        setConstraint()
        
    }
    
    fileprivate func setupView(currentView: UIView){
        //let myView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
        
        currentView.backgroundColor = UIColor.init(colorWithHexValue: 0x225564, alpha: 1.0)
    }
    
    fileprivate func addSubview(currentView: UIView){
        currentView.backgroundColor = UIColor.init(colorWithHexValue: 0x0C331A, alpha: 1.0)
        currentView.addSubview(backButton)
        currentView.addSubview(emailLabel)
        currentView.addSubview(emailTextField)
        view.addSubview(currentView)
    }
    
    fileprivate func setConstraint(){
        setBackButton()
        setEmailLabel()
        setEmailTextField()
    }
    
    fileprivate func setEmailLabel(){
        emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        //emailLabel.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        //emailLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    fileprivate func setEmailTextField(){
        emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 20).isActive = true
        emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -50).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    fileprivate func setBackButton(){
        backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backButton.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    /* ############################### ACTION ON BUTTONS ############################### */
    
    //Action for email login button
    func actionBackButton(){
        self.navigationController?.popToRootViewController(animated: true)
    }
}

