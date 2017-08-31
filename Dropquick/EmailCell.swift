//
//  EmailCell.swift
//  Dropquick
//
//  Created by Sung Jae Min on 8/29/17.
//  Copyright © 2017 Dropquick. All rights reserved.
//

import UIKit

class EmailCell: UICollectionViewCell, UITextFieldDelegate{
    
    var registerController: RegisterController?
    var register: Register?
    
    let emailLabel: UILabel = {
        
        let label = UILabel()
        label.text = "What's Your Email Address?"
        label.textColor = .white
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let emailTextField: LeftPaddedTextField = {
        let textField = LeftPaddedTextField()
        
        textField.placeholder = "Enter your email address"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 5
        textField.layer.masksToBounds = true
        textField.layer.borderWidth = 1
        textField.keyboardType = .emailAddress
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
        setupConstraint()
    }
    
    fileprivate func addSubviews(){
        addSubview(emailLabel)
        addSubview(emailTextField)
        addSubview(nextButton)
        addSubview(backButton)
    }
    
    fileprivate func setupConstraint(){
        emailLabelConstraint()
        emailTextFieldConstraint()
        nextButtonConstraint()
        backButtonConstraint()
    }
    
    fileprivate func emailLabelConstraint(){
        emailLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        emailLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -70).isActive = true
    }
    
    fileprivate func emailTextFieldConstraint(){
        emailTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        emailTextField.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: widthAnchor, constant: -50).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        emailTextField.keyboardType = .emailAddress
    }
    
    fileprivate func nextButtonConstraint(){
        nextButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        nextButton.bottomAnchor.constraint(equalTo: backButton.topAnchor).isActive = true
        nextButton.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    func backButtonConstraint(){
        backButton.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        backButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        backButton.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    func keyboardSetting(){
        self.emailTextField.delegate = self
        self.emailTextField.autocorrectionType = .no
        self.emailTextField.clearButtonMode = .whileEditing
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.emailTextField.endEditing(true)
    }
    
    @objc func handleNextButton(){
    
        let emailAddress = emailTextField.text!
        
        if emailTextField.text != ""{
            let isEmailAddressValid = isValidEmailAddress(emailAddressToCheck: emailAddress)
            
            
            if isEmailAddressValid == true{
                registerController?.moveToNextCell(text: emailTextField.text!)
            }
            else{
                print("Invalid email format!")
            }
        }
        else{
            print("Please enter email address!")
        }
    }
    
    func isValidEmailAddress(emailAddressToCheck: String) -> Bool {
        
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressToCheck as NSString
            let results = regex.matches(in: emailAddressToCheck, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        return  returnValue
    }
    
    @objc func handleBackButton(){
        registerController?.finishRegister()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

