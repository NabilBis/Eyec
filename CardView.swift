//
//  CardView.swift
//  Notify
//
//  Created by macos on 09/12/2019.
//  Copyright © 2019 bablo. All rights reserved.
//

import Foundation
import UIKit


class CardView : UIView {
    private var titleLabel = UILabel()
    private var descriptionLabel = UILabel()
    private var seperatorView = UIView()
    
    init(){
        super.init(frame: CGRect())
    }
    
    init(frame: CGRect, titleTxt: String, descTxt: String/*, image: UIImage? = nil*/){
        super.init(frame: frame)
        
        self.layer.masksToBounds = true
        self.isUserInteractionEnabled = true
//        self.layer.contents = image?.cgImage
        
        initTitleLabel(titleTxt)
        initDescriptionLabel(descTxt)
        initSeperatorView()
    }
    
    func initTitleLabel(_ txt: String){
        let origin = CGPoint(x: 10, y: 10)
        
        titleLabel.text = txt
        titleLabel.textColor = .black
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont(name: "GillSans-SemiBold", size: 16)!
        titleLabel.sizeToFit()

        titleLabel.frame = CGRect(origin: origin, size: titleLabel.frame.size)
        
        self.addSubview(titleLabel)
    }
    
    func initDescriptionLabel(_ txt: String){
        let origin = CGPoint(x: titleLabel.frame.origin.x, y: titleLabel.frame.maxY + 15)
        
        descriptionLabel.text = txt
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: UIFont.systemFontSize)!
        descriptionLabel.textColor = UIColor(red: 0.4157, green: 0.3725, blue: 0.6588, alpha: 1.0)
        descriptionLabel.textAlignment = .left
        descriptionLabel.sizeToFit()
        
        descriptionLabel.frame  = CGRect(origin: origin, size: descriptionLabel.frame.size)
        self.addSubview(descriptionLabel)
    }
    
    func initSeperatorView(){
        
        let size = CGSize(width: frame.width * 0.6, height: 2)
        let origin = CGPoint(x: (frame.width - size.width)/2, y: frame.height - 40)
        
        seperatorView.frame = CGRect(origin: origin, size: size)

        seperatorView.layer.cornerRadius = 5

        seperatorView.backgroundColor = UIColor(red: 0.3961, green: 0.5373, blue: 0.698, alpha: 1.0)
        self.addSubview(seperatorView)
//        seperatorView.addShadow()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
