//
//  PasswordCell.swift
//  Dropquick
//
//  Created by Sung Jae Min on 8/30/17.
//  Copyright © 2017 Dropquick. All rights reserved.
//

import UIKit

class PasswordCell: UICollectionViewCell, UITextFieldDelegate{
    
    var registerController: RegisterController?
    
    let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter your password"
        label.textColor = .white
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let passwordTextField: LeftPaddedTextField = {
        let textField = LeftPaddedTextField()
        
        textField.placeholder = "Enter your password"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 5
        textField.layer.masksToBounds = true
        textField.layer.borderWidth = 1
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    lazy var nextButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.backgroundColor = .orange
        button.setTitle("NEXT", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel!.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleNextButton), for: .touchUpInside)
        
        return button
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        let buttonColor = UIColor.init(colorWithHexValue: 0x555555, alpha: 1.0)
        
        button.backgroundColor = buttonColor
        button.setTitle("BACK", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel!.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleBackButton), for: .touchUpInside)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(red: 12/255, green: 51/255, blue: 26/255, alpha: 1.0)
    
        addSubviews()
        keyboardSetting()
        setupConstraints()
    }
    
    fileprivate func addSubviews(){
        addSubview(passwordLabel)
        addSubview(passwordTextField)
        addSubview(nextButton)
        addSubview(backButton)
    }
    
    func setupConstraints(){
        passwordLabelConstraint()
        passwordTextFieldConstraint()
        nextButtonConstraint()
        backButtonConstraint()
    }
    
 func passwordLabelConstraint(){
        passwordLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        passwordLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -70).isActive = true
    }
    
    fileprivate func passwordTextFieldConstraint(){
        passwordTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        passwordTextField.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: widthAnchor, constant: -50).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        passwordTextField.keyboardType = .emailAddress
    }
    
    fileprivate func nextButtonConstraint(){
        nextButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        nextButton.bottomAnchor.constraint(equalTo: backButton.topAnchor).isActive = true
        nextButton.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    fileprivate func backButtonConstraint(){
        backButton.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        backButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        backButton.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    func keyboardSetting(){
        self.passwordTextField.delegate = self
        self.passwordTextField.autocorrectionType = .no
        self.passwordTextField.clearButtonMode = .whileEditing
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.passwordTextField.endEditing(true)
    }
    
    @objc func handleNextButton(){
        print("NEXT")
    }
    
    @objc func handleBackButton(){
        registerController?.moveToPrevCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
