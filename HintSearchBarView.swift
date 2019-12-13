//
//  HintSearchBarView.swift
//  Notify
//
//  Created by macos on 11/12/2019.
//  Copyright © 2019 bablo. All rights reserved.
//

import Foundation
import UIKit



class HintSearchBarView : UIView {
    
    private var textField = UITextField()
    private var textFieldHints : UILabel?
    private var icon = UIView()
    private var hints = [UIView]()
    private var hintsViewContainer = UIView()
    
    private var data = [String]() {
        didSet {
//            print(textField.text)
            icon.layer.contents = UIImage(named: "cross")?.cgImage
           for hint in hints {
                hint.removeFromSuperview()
           }
            addHintViews()
            self.setNeedsDisplay()
        }
    }
    
    public var dataMutator : [String]! {
        get {
            return nil
        }
        set {
            data = newValue
        }
    }
    
    init(frame: CGRect, textFieldDelegate: UITextFieldDelegate)
    {
        super.init(frame: frame)
        
        initSearchBar()
        textField.delegate = textFieldDelegate
        initIcon(image: UIImage(named: "search")!)
        self.backgroundColor = UIColor(red: 0.8902, green: 0.9216, blue: 0.9569, alpha: 1.0)
    }
    
    
    func initSearchBar()
    {
         let size = CGSize(width: frame.width * 0.7, height: frame.height * 0.9)
         let origin = CGPoint(x: 0.05 * frame.width, y: (frame.height - size.height)/2)
        
        textField.frame = CGRect(origin: origin, size: size)
        textField.placeholder = "Search"
        self.addSubview(textField)
    }
    
    func initIcon(image: UIImage)
    {
        let ww = frame.width * 0.07
        let size = CGSize(width: ww, height: ww)
        let origin = CGPoint(x: frame.width - size.width - (0.05*frame.width), y: (frame.height - size.height)/2)
        
        icon.frame = CGRect(origin: origin, size: size)
        icon.layer.contents = image.cgImage
        icon.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clearTextField)))
        self.addSubview(icon)
    }
    
    func addHintViews()
    {
        let size = CGSize(width: icon.frame.origin.x, height: frame.height * 0.8 * CGFloat(data.count))
        
        let origin = CGPoint(x: textField.frame.origin.x, y: frame.height + 10)
        
        hintsViewContainer.frame = CGRect(origin: origin, size: size)
        
        for i in 0 ..< data.count {
            let labelSize = CGSize(width: size.width, height: size.height / CGFloat(data.count))
            let labelOrigin = CGPoint(x: 2, y: labelSize.height * CGFloat(i) - 2)
            let hint = UILabel(frame: CGRect(origin: labelOrigin, size: labelSize))
               hint.text = data[i]
               hint.textAlignment = .left
            
            hintsViewContainer.addSubview(hint)
            self.hints.append(hint)
        }
        
        self.addSubview(hintsViewContainer)
        
        if let superview = hintsViewContainer.superview {
            hintsViewContainer.backgroundColor = superview.backgroundColor
            hintsViewContainer.layer.cornerRadius  = superview.layer.cornerRadius
        }
        
    }
    
    @objc func clearTextField(){
        if textField.text != nil {
            textField.text = ""
            icon.layer.contents = UIImage(named: "search")?.cgImage
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
