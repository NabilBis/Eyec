//
//  UIViewExtension.swift
//  Notify
//
//  Created by macos on 11/12/2019.
//  Copyright © 2019 bablo. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func addShadow(color: UIColor = .black){
        let shadowView = UIView()
        
        shadowView.frame = frame
        
        shadowView.layer.backgroundColor = color.cgColor
        shadowView.layer.shadowColor = color.cgColor
        shadowView.layer.shadowOffset = CGSize(width: 3, height: 3)
        shadowView.layer.shadowOpacity = 0.3
        shadowView.layer.shadowRadius = 4.0
        shadowView.layer.masksToBounds = false
        shadowView.isUserInteractionEnabled = false
        shadowView.layer.cornerRadius = self.layer.cornerRadius + 4
        
        if let superView = superview {
            superView.insertSubview(shadowView, at: 0)
        }
    }
}
