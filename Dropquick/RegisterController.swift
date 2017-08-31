//
//  EmailRegiesterController.swift
//  Dropquick
//
//  Created by Sung Jae Min on 8/28/17.
//  Copyright © 2017 Dropquick. All rights reserved.
//

import UIKit

class RegisterController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UITextFieldDelegate{

    let emailCellId = "emailCellId"
    let passwordCellId = "passwordCellId"
    
    var email: String? = nil
    private var password: String? = nil
    
    var register: Register?
    var emailCell: EmailCell?
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0

        cv.isScrollEnabled = true
        cv.isPagingEnabled = true
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        observeKeyboardNotifications()
        setupCollectionView()
        
        self.automaticallyAdjustsScrollViewInsets = false
    }
    
    func setupCollectionView(){
       
        view.addSubview(collectionView)
        collectionView.backgroundColor = UIColor(red: 12/255, green: 51/255, blue: 26/255, alpha: 1.0)
    
        collectionView.anchorToTop(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        
        collectionView.register(EmailCell.self, forCellWithReuseIdentifier: emailCellId)
        collectionView.register(PasswordCell.self, forCellWithReuseIdentifier: passwordCellId)
        
    }
    
    func finishRegister(){
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func moveToNextCell(text: String){
        email = text
        collectionView.scrollToItem(at: IndexPath(item: 1, section: 0), at: .right, animated: true)
    }
    
    func moveToPrevCell(){
        collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .left, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let emailCell = collectionView.dequeueReusableCell(withReuseIdentifier: emailCellId, for: indexPath) as! EmailCell
        
        if indexPath.item == 1{
            let passwordCell = collectionView.dequeueReusableCell(withReuseIdentifier: passwordCellId, for: indexPath) as! PasswordCell
            
            passwordCell.registerController = self
            
            return passwordCell
        }
        
        emailCell.registerController = self
        
        return emailCell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    fileprivate func observeKeyboardNotifications(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow), name: .UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHide), name: .UIKeyboardWillHide, object: nil)
    }
    
    @objc func keyboardShow(){
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.frame  = CGRect(x: 0, y: -50, width: self.view.frame.width, height: self.view.frame.height)
        }, completion: nil)
    }
    
    @objc func keyboardHide(){
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        }, completion: nil)
    }
}
