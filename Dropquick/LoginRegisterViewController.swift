//
//  LoginController.swift
//  Dropquick
//
//  Created by Sung Jae Min on 8/1/17.
//  Copyright © 2017 Dropquick. All rights reserved.
//

import UIKit

class LoginRegisterViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginRegisterView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
        
        view.addSubview(loginRegisterView)
        
    }
    
    /* ############################### ACTION ON BUTTONS ############################### */
    
    //Action for email login button
    func actionRegisterButton(){
        
        let registerViewController = RegisterViewController()
        registerViewController.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.navigationController?.pushViewController(registerViewController, animated: true)
    }
}
