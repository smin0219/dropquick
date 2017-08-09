//
//  RegisterViewController.swift
//  Dropquick
//
//  Created by Sung Jae Min on 8/6/17.
//  Copyright © 2017 Dropquick. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController{
    
    override func viewDidLoad(){
        super.viewDidLoad()

        let myView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))

        myView.backgroundColor = UIColor.init(colorWithHexValue: 0x225564, alpha: 1.0)
        myView.addSubview(backButton)
        view.addSubview(myView)
        
        setBackButton()
    }
    
    let backButton: UIButton = {
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
    
    //Set constraint for register button
    func setBackButton(){
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
