//
//  ProfileView.swift
//  Notify
//
//  Created by macos on 08/12/2019.
//  Copyright © 2019 bablo. All rights reserved.
//

import Foundation
import UIKit



class ProfileView : UIView {
    public var mainSubview = UIView()
    public var profileView = UIView()
    public var nameLabel = UILabel()
    public var localizationLabel = UILabel()
    public var localizationIcon = UIView()
    public var seperatorView = UIView()
    public var segmentationView  : SegementationView!
    private var dismissLabel : UILabel!
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        backgroundColor = .black
        initMainSubview()
        initProfileView()
        initNameLabel()
        initLocalizationLabel()
        initSeperatorView()
        initSegmentationView()
        initDismissLabel()
    }
    
    func initMainSubview(){
        let size = CGSize(width: self.bounds.width * 0.9, height: self.bounds.height * 0.8)
        let origin = CGPoint(x: (self.bounds.width - size.width)/2, y: self.bounds.height - size.height - 10)
        
        mainSubview.frame = CGRect(origin: origin, size: size)
        mainSubview.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        mainSubview.layer.cornerRadius = 14
//        mainSubview.layer.opacity = 0.7
        self.addSubview(mainSubview)
    }
    
    func initProfileView(){
        let size = CGSize(width: mainSubview.bounds.width/3, height: mainSubview.bounds.width/3)
        let origin = CGPoint(x: mainSubview.bounds.midX - size.width/2, y: -(size.height/2))
        
        profileView.frame = CGRect(origin: origin, size: size)
        profileView.layer.contents = UIImage(named: "profile")?.cgImage
        profileView.layer.cornerRadius = size.width/2
        profileView.layer.masksToBounds = true
        mainSubview.addSubview(profileView)
    }
    
    func initNameLabel(){
        nameLabel.text = "Devon Carlson"
        nameLabel.textAlignment = .center
        nameLabel.sizeToFit()
        let origin = CGPoint(x:(mainSubview.bounds.width - nameLabel.frame.width)/2 , y: profileView.bounds.height/2 + 10 )
        nameLabel.frame.origin = origin
        mainSubview.addSubview(nameLabel)
    }
   
    func initLocalizationLabel(){
        
        localizationLabel.text = "Kyoto, Japan"
        localizationLabel.textAlignment = .center
        localizationLabel.textColor = UIColor(red: 0.5961, green: 0.6078, blue: 0.6275, alpha: 1.0)
        localizationLabel.font = UIFont(name: "ArialHebrew-Bold", size: 11)
        
        localizationLabel.sizeToFit()
        let origin = CGPoint(x: (mainSubview.frame.width - localizationLabel.bounds.width)/2, y: nameLabel.frame.maxY + 5)
        localizationLabel.frame.origin = origin
        
        localizationIcon.frame = CGRect(x: localizationLabel.frame.maxX + 3, y: localizationLabel.frame.minY - 3, width: localizationLabel.frame.height, height: localizationLabel.frame.height)
        localizationIcon.layer.contents = UIImage(named: "pin")?.cgImage
        
        mainSubview.addSubview(localizationLabel)
        mainSubview.addSubview(localizationIcon)
    }
    
    func initSeperatorView() {
        let size = CGSize(width: mainSubview.frame.width * 0.6, height: 1)
        let origin = CGPoint(x: (mainSubview.frame.width-size.width)/2, y: localizationLabel.frame.maxY + 25)
        
        seperatorView.frame = CGRect(origin: origin, size: size)
        seperatorView.backgroundColor = .white
        
        mainSubview.addSubview(seperatorView)
    }
    
    func initSegmentationView(){
        let size = CGSize(width: mainSubview.frame.width * 0.85, height: mainSubview.frame.height - seperatorView.frame.maxY - 40)
        let origin = CGPoint(x: (mainSubview.frame.width-size.width)/2, y: seperatorView.frame.maxY+25)
        
        segmentationView = SegementationView(frame: CGRect(origin: origin, size: size), buttonIcon: [UIImage(named: "qbar"), UIImage(named: "chat"), UIImage(named: "add")])
        segmentationView.layer.cornerRadius = 8
        mainSubview.addSubview(segmentationView)
        
    }
    
    func initDismissLabel() {
        let size = CGSize(width: 30, height: 30)
        let origin = CGPoint(x: UIScreen.main.bounds.width - size.width - 20, y: 25)
        
        dismissLabel = UILabel(frame: CGRect(origin: origin, size: size))
        dismissLabel.text = "X"
        dismissLabel.textColor = .white
        dismissLabel.textAlignment = .center
        
        dismissLabel.layer.cornerRadius = size.width/2
        dismissLabel.layer.borderColor = UIColor.white.cgColor
        dismissLabel.layer.borderWidth = 1
        
        self.addSubview(dismissLabel)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
