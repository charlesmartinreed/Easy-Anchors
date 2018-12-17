//
//  UIView+extension.swift
//  Easy Anchors
//
//  Created by Charles Martin Reed on 12/16/18.
//  Copyright © 2018 Charles Martin Reed. All rights reserved.
//

import UIKit

extension UIView {
    
    func fillSuperview() {
        anchor(top: superview?.topAnchor, leading: superview?.leadingAnchor, bottom: superview?.bottomAnchor, trailing: superview?.trailingAnchor)
    }
    
    func anchorSize(to view: UIView) {
        widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1).isActive = true
    }
    
    //optional anchors allows us to account for smaller views within larger views without pissing off the Swift compiler with seemingly conflicting constraints
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let leading = leading {
             leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
       
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if let trailing = trailing {
             trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
        //granular size control for embedded views
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
        
    }
}
