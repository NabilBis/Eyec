//
//  ChatView.swift
//  Notify
//
//  Created by macos on 14/12/2019.
//  Copyright © 2019 bablo. All rights reserved.
//

import Foundation
import UIKit

class ChatView : UIView {
    private var userImage = UIImageView()
    private var textLabel = UILabel()
    private var searchBar : HintSearchBarView!
    private var friendLabel = UILabel()
    private var groupLabel = UILabel()
    private var backView = UIView()
    private var chatViews = [CellChatView]()
    
    init(frame: CGRect, searchBarDelegate: UITextFieldDelegate) {
        super.init(frame: frame)
        
        initUserImage(image: UIImage(named: "profile"))
        initTextLabel(text: "Discussions")
        initSearchBar(searchBarDelegate: searchBarDelegate)
        initFriendGroupLab()
        initBackView()

        let size = CGSize(width: frame.width, height: 60)
        let first = CellChatView(frame: CGRect(origin: .zero, size: size), image: UIImage(named: "fri2")!)
        let second = CellChatView(frame: CGRect(origin: .zero, size: size), image: UIImage(named: "friend1")!)
        
        self.chatViews.append(first)
        self.chatViews.append(second)
    
        
        chatViews(cvs: chatViews)
    }
    
    
    
    func initUserImage(image : UIImage?)
    {
        let size = CGSize(width: frame.width * 0.1, height: frame.width * 0.1)
        let origin = CGPoint(x: 12, y: frame.height * 0.12)
        
        userImage.frame = CGRect(origin: origin, size: size)
        userImage.image = image
        userImage.layer.cornerRadius = size.width/2
        userImage.layer.masksToBounds = true
        userImage.contentMode = .redraw
        
        self.addSubview(userImage)
    }
    
    func initTextLabel(text: String?)
    {
        textLabel.text = text
        textLabel.textAlignment = .left
        textLabel.font =  UIFont(name: "HelveticaNeue", size: 25)!
        textLabel.sizeToFit()
        
        let origin = CGPoint(x: userImage.frame.maxX + 8, y: userImage.center.y - textLabel.frame.size.height/2)
        
        textLabel.frame.origin = origin
        
        self.addSubview(textLabel)
    }
    
    func initSearchBar(searchBarDelegate: UITextFieldDelegate)
    {
        let size = CGSize(width: frame.width * 0.7, height: 40)
        let origin = CGPoint(x: (frame.width - size.width )/2, y: userImage.frame.maxY + 20)
        
        let fram = CGRect(origin: origin, size: size)
        
        searchBar = HintSearchBarView(frame: fram, textFieldDelegate: searchBarDelegate)
        searchBar.backgroundColor = UIColor(red: 0.7608, green: 0.8078, blue: 0.7686, alpha: 1.0)
        searchBar.layer.cornerRadius = 8
        
        self.addSubview(searchBar)
    }
    
    func initFriendGroupLab()
    {
        friendLabel.text = "Friends"
        friendLabel.textAlignment = .center
        friendLabel.backgroundColor = searchBar.backgroundColor
        friendLabel.sizeToFit()
        friendLabel.textColor = .white
        friendLabel.layer.cornerRadius = 12
        friendLabel.layer.masksToBounds = true
        
        groupLabel.text = "Groups"
        groupLabel.textAlignment = .center
        groupLabel.textColor = .white
        groupLabel.layer.cornerRadius = friendLabel.layer.cornerRadius
        groupLabel.layer.cornerRadius = friendLabel.layer.cornerRadius
        groupLabel.backgroundColor = .brown//friendLabel.backgroundColor
        groupLabel.layer.masksToBounds = true
        groupLabel.sizeToFit()
        
        let friendOrigin = CGPoint(x: 85, y: searchBar.frame.maxY + 20)
        let friendSize = CGSize(width: friendLabel.frame.width + 33, height: friendLabel.frame.height + 5)
        friendLabel.frame = CGRect(origin: friendOrigin, size: friendSize)
        
        let groupOrigin = CGPoint(x: friendLabel.frame.maxX + 40, y: friendOrigin.y)
        let groupSize = CGSize(width: groupLabel.frame.width + 33, height: groupLabel.frame.height + 5)
        groupLabel.frame = CGRect(origin: groupOrigin, size: groupSize)
        
        self.addSubview(friendLabel)
        self.addSubview(groupLabel)
    }
    
    func initBackView()
    {
        let padding : CGFloat = 40
        let size = CGSize(width: frame.width, height: friendLabel.frame.maxY + padding)
        let origin = CGPoint(x: 0, y: 10 - padding)
        
        backView.frame = CGRect(origin: origin, size: size)
        backView.backgroundColor = UIColor(red: 0.5098, green: 0.6824, blue: 0.7098, alpha: 1.0)
        backView.layer.masksToBounds = true
        backView.layer.cornerRadius = 40
        
        self.insertSubview(backView, at: 0)
    }
    
    func chatViews(cvs: [CellChatView])
    {
        let size = CGSize(width: frame.width, height: 60)
        let unorigin = backView.frame.maxY + 20
        
        for i in 0..<cvs.count {
            let origin = CGPoint(x: 0, y: unorigin + CGFloat(i)*(size.height + 3))
            cvs[i].frame = CGRect(origin: origin, size: size)
            self.addSubview(cvs[i])
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
