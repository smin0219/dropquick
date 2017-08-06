//
//  MainNavigationController.swift
//  Dropquick
//
//  Created by Sung Jae Min on 8/2/17.
//  Copyright © 2017 Dropquick. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(colorWithHexValue: 0x225564, alpha: 1.0)
        self.navigationBar.isHidden = true
        
        let isLoggedIn = false
       
        //present(loginRegisterViewController, animated: true, completion: nil)
        
        if isLoggedIn{
            
        }else{
            perform(#selector(showLoginRegisterViewController), with: nil, afterDelay: 0.01)
        }
    }
    
    func showLoginRegisterViewController(){
        let loginRegisterViewController = LoginRegisterViewController()
        present(loginRegisterViewController, animated: true, completion: nil)
    }
}
