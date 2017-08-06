//
//  Extensions.swift
//  Dropquick
//
//  Created by Sung Jae Min on 8/2/17.
//  Copyright © 2017 Dropquick. All rights reserved.
//

import UIKit

extension UIView{
    
    func anchorToTop(top: NSLayoutYAxisAnchor?=nil, left: NSLayoutXAxisAnchor?=nil, bottom: NSLayoutYAxisAnchor?=nil, right: NSLayoutXAxisAnchor?=nil){
        
        anchorWithConstantToTop(top: top, left: left, bottom: bottom, right: right, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
    }
    
    func anchorWithConstantToTop(top: NSLayoutYAxisAnchor?=nil, left: NSLayoutXAxisAnchor?=nil, bottom: NSLayoutYAxisAnchor?=nil, right: NSLayoutXAxisAnchor?=nil, topConstant: CGFloat = 0, leftConstant: CGFloat = 0, bottomConstant: CGFloat = 0, rightConstant: CGFloat = 0){
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top{
            topAnchor.constraint(equalTo: top, constant: topConstant).isActive = true
        }
        
        if let bottom = bottom{
            bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstant).isActive = true
        }
        
        if let left = left{
            leftAnchor.constraint(equalTo: left, constant: leftConstant).isActive = true
        }
        
        if let right = right{
            rightAnchor.constraint(equalTo: right, constant: -rightConstant).isActive = true
        }
    }
}

extension UIColor{
    convenience init(colorWithHexValue value: Int, alpha:CGFloat = 1.0){
        self.init(
            red: CGFloat((value & 0xFF0000) >> 16)/255.0,
            green: CGFloat((value & 0x00FF00) >> 8)/255.0,
            blue: CGFloat(value & 0x0000FF)/255.0,
            alpha: alpha
        )
    }
}
