//
//  CellChatView.swift
//  Notify
//
//  Created by macos on 14/12/2019.
//  Copyright © 2019 bablo. All rights reserved.
//

import Foundation
import UIKit

class CellChatView : UIView {
    let friendImage = UIImageView()
    let friendName = UILabel()
    let message = UILabel()
    let msgTime = UILabel()
    
    
    init(frame: CGRect, image: UIImage) {
        super.init(frame: frame)
        
        initFriendImage(image: image)
        initFriendName(name: "Lady Zee")
        initMessage(message: "Sounds goods.")
        initMsgTime(time: "9.43")
        
        self.backgroundColor = UIColor(red: 0.9569, green: 0.9608, blue: 0.9686, alpha: 1.0)
        
    }
   
    private func initFriendImage(image: UIImage?)
    {
        let size = CGSize(width: frame.height * 0.8, height: frame.height * 0.8)
        let origin = CGPoint(x: 10, y: (frame.height - size.height)/2)
        
        friendImage.frame = CGRect(origin: origin, size: size)
        friendImage.layer.cornerRadius = size.width/2
//        friendImage.contentMode = .redraw
        friendImage.image = image
        friendImage.layer.masksToBounds = true
        friendImage.backgroundColor = .red
        
        self.addSubview(friendImage)
    }
    
    private func initFriendName(name: String)
    {
        let origin = CGPoint(x: friendImage.frame.maxX + 10, y: friendImage.frame.minY + 7)
        
        friendName.text = name
        friendName.font = UIFont(name: "HelveticaNeue-Bold", size: UIFont.systemFontSize)!
        friendName.sizeToFit()
        friendName.frame.origin = origin
        
        self.addSubview(friendName)
    }
    
    private func initMessage(message msg: String)
    {
        let origin = CGPoint(x: friendName.frame.minX, y: friendName.frame.maxY + 2)
        
        message.text = msg
        message.font = UIFont(name: "AppleSDGothicNeo-Regular", size: UIFont.systemFontSize)!
        message.textColor = UIColor.darkGray
        message.sizeToFit()
        message.frame.origin = origin
        
        self.addSubview(message)
    }
    
    private func initMsgTime(time: String)
    {
        msgTime.text = time
        msgTime.font = UIFont(name: "HelveticaNeue-CondensedBold", size: 12)!
        msgTime.sizeToFit()
        
        let origin = CGPoint(x: frame.width - msgTime.frame.width - 15, y: (frame.height - msgTime.frame.height)/2)
        msgTime.frame.origin = origin
        
        self.addSubview(msgTime)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
