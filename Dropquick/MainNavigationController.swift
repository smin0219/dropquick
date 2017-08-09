//
//  MainNavigationController.swift
//  Dropquick
//
//  Created by Sung Jae Min on 8/9/17.
//  Copyright © 2017 Dropquick. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let nav = UINavigationController()
        let loginRegisterViewController = LoginRegisterViewController()
        self.viewControllers = [loginRegisterViewController]
        self.navigationBar.isHidden = true

    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
}
