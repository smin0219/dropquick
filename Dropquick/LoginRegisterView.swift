//
//  LoginRegisterView.swift
//  Dropquick
//
//  Created by Sung Jae Min on 8/6/17.
//  Copyright © 2017 Dropquick. All rights reserved.
//

import UIKit

class LoginRegisterView: LoginRegisterViewController{
    
    //let loginRegisterViewController = LoginRegisterViewController()
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"Dropquick2")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.action
        return imageView
    }()
    
    let emailLoginButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.init(colorWithHexValue: 0xFF7F00, alpha: 1.0)
        button.setTitle("Connect using email", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.titleLabel!.font = UIFont(name: "Arial Rounded MT Bold", size: 17)
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.addTarget(self, action: #selector(actionEmailButton), for: .touchUpInside)
        
        //button.addTarget(self, action: actionEmailButton(), for: .touchUpInside)
        return button
    }()
    
    /** Create social login button
     * Hex info for background color of the button: 0xFF7F00
     */
    
    let socialLoginButton: UIButton = {
        let button = UIButton(type: .system)
        let titleColor = UIColor.init(colorWithHexValue: 0xFF7F00, alpha: 1.0)
        
        button.backgroundColor = .white
        button.setTitle("Connect using social accounts", for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.titleLabel!.font = UIFont(name: "Arial Rounded MT Bold", size: 17)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("Forgot password?", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel!.font = UIFont(name: "Arial Rounded MT Bold", size: 15)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let registerButton: UIButton = {
        let button = UIButton(type: .system)
        let buttonColor = UIColor.init(colorWithHexValue: 0x555555, alpha: 1.0)
        
        //let registerViewController = RegisterViewController()
        
        button.backgroundColor = buttonColor
        button.setTitle("Sign Up for Dropquick", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel!.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(actionRegisterButton), for: .touchUpInside)
        
        return button
    }()
    
    override init() {
        
        super.init
        
        //0x225564 BLUE
        //currentView.backgroundColor = UIColor.init(colorWithHexValue: 0x0C331A, alpha: 1.0)
        setupView(currentView: loginRegisterView)
        addSubview(currentView: loginRegisterView)
        setupConstraint()
        
    }
    
    fileprivate func setupView(currentView: UIView){
        currentView.backgroundColor = UIColor.init(colorWithHexValue: 0x0C331A, alpha: 1.0)
    }
    
    fileprivate func addSubview(currentView: UIView){
        currentView.addSubview(logoImageView)
        currentView.addSubview(emailLoginButton)
        currentView.addSubview(socialLoginButton)
        currentView.addSubview(forgotPasswordButton)
        currentView.addSubview(registerButton)
        view.addSubview(currentView)
    }
    
    fileprivate func setupConstraint(){
        setLogoImageView()
        setEmailLoginButton()
        setSocialLoginButton()
        setForgotPasswordButton()
        setRegisterButton()
    }
    
    func setLogoImageView(){
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImageView.bottomAnchor.constraint(equalTo: emailLoginButton.topAnchor, constant: -50).isActive = true
        logoImageView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -170).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
    }
    
    //Set constraint for email login button
    func setEmailLoginButton(){
        emailLoginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailLoginButton.bottomAnchor.constraint(equalTo: socialLoginButton.topAnchor, constant: -10).isActive = true
        emailLoginButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -50).isActive = true
        emailLoginButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    //Set constraint for social login button
    func setSocialLoginButton(){
        socialLoginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        socialLoginButton.bottomAnchor.constraint(equalTo: forgotPasswordButton.topAnchor, constant: -40).isActive = true
        socialLoginButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -50).isActive = true
        socialLoginButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    //Set constraint for forgot password button
    func setForgotPasswordButton(){
        forgotPasswordButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        forgotPasswordButton.bottomAnchor.constraint(equalTo: registerButton.topAnchor, constant: -40).isActive = true
    }
    
    //Set constraint for register button
    func setRegisterButton(){
        registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registerButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        registerButton.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
}
