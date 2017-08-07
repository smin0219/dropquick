//
//  MainNavigationController.swift
//  Dropquick
//
//  Created by Sung Jae Min on 8/2/17.
//  Copyright © 2017 Dropquick. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController{

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(colorWithHexValue: 0x225564, alpha: 1.0)
        self.navigationBar.isHidden = true
        
        let isLoggedIn = false
        
        /*
        view.addSubview(collectionView)
        
        collectionView.anchorToTop(top:view.topAnchor, left:view.leftAnchor, bottom:view.bottomAnchor, right: view.rightAnchor)
       
        //present(loginRegisterViewController, animated: true, completion: nil)
        */
        
        if isLoggedIn{
            
        }else{
            perform(#selector(showCollectionViewController), with: nil, afterDelay: 0.01)
        }
 
    }
    
    func showCollectionViewController(){
    let collectionViewController = CollectionViewController()
        present(collectionViewController, animated: true, completion: nil)
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        print(UIDevice.current.orientation.isLandscape)

    }
}
