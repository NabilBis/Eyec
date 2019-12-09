//
//  ScanView.swift
//  Notify
//
//  Created by macos on 08/12/2019.
//  Copyright © 2019 bablo. All rights reserved.
//

import Foundation
import UIKit


class ScanView: UIView {
    public var scanActionLabel = UILabel()
    public var textLabel = UILabel()
    public var scanImageView = UIImageView()
    public var settingView = UIView()
    public var profileView = UIView()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        initQbarView()
        initTextLabel()
        initScanAction()
        initSettingView()
        initProfileView()
        self.layer.contents = UIImage(named: "background")?.cgImage
        
    }
    
    
    func initQbarView() {
        let size = CGSize(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.width/3)
        let origin = CGPoint(x: UIScreen.main.bounds.width/2 - size.width/2, y: UIScreen.main.bounds.height/2 - size.height/2)
        let qbarFrame = CGRect(origin: origin, size: size)
        
        scanImageView.frame = qbarFrame
        
        scanImageView.image = UIImage(named: "qbar")
        self.addSubview(scanImageView)
        
        
    }
    
    func initScanAction() {
        scanActionLabel.text = "Scan To Tell"
        scanActionLabel.font = UIFont(name: "ArialHebrew-Bold", size: 11)
        scanActionLabel.textAlignment = .center
        scanActionLabel.textColor = UIColor(red: 0.5176, green: 0.5137, blue: 0.5176, alpha: 1.0)
        
        scanActionLabel.sizeToFit()
        let origin = CGPoint(x: scanImageView.frame.midX-(scanActionLabel.bounds.width/2), y: scanImageView.frame.maxY+20)
        scanActionLabel.frame.origin = origin
        self.addSubview(scanActionLabel)
    }
    
    
    func initTextLabel() {
        
        textLabel.text = "Because every image tells\n a STORY"
        textLabel.font = UIFont(name: "Avenir-Heavy", size: 19)!
        textLabel.textColor = UIColor(red: 0.3529, green: 0.3569, blue: 0.3529, alpha: 1.0)
        textLabel.numberOfLines = 0
//        textLabel.lineBreakMode = .byTruncatingTail
        textLabel.textAlignment = .center
        textLabel.sizeToFit()
        textLabel.frame.origin = CGPoint(x: UIScreen.main.bounds.width/2 - textLabel.frame.width/2, y: UIScreen.main.bounds.height/5)
        self.addSubview(textLabel)
    }
    
    func initSettingView() {
        let size = CGSize(width: 30, height: 30)
        let origin = CGPoint(x: UIScreen.main.bounds.width - size.width - 15, y: 25)
        settingView.frame = CGRect(origin: origin, size: size)
        settingView.layer.contents = UIImage(named: "setting")?.cgImage
        self.addSubview(settingView)
    }
    
    func initProfileView(){
        let size = CGSize(width: 40, height: 40)
        let origin = CGPoint(x: 15, y: 25)
        profileView.frame = CGRect(origin: origin, size: size)
        profileView.layer.cornerRadius = size.width/2
        profileView.layer.borderWidth = 1
        profileView.layer.borderColor = UIColor.brown.cgColor
        profileView.layer.contents = UIImage(named: "profile")?.cgImage
        profileView.layer.masksToBounds = true
        self.addSubview(profileView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
