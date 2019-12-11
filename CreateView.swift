//
//  CreateView.swift
//  Notify
//
//  Created by macos on 09/12/2019.
//  Copyright © 2019 bablo. All rights reserved.
//

import Foundation
import UIKit


class CreateView : UIView {
    private var mainLabel = UILabel()
    private var secondaryLabel : UILabel?
    public var cards : [CardView]!
    
    init(frame: CGRect,mainText: String, touples: [(title: String, description: String)]){
        super.init(frame: frame)
        
        cards = [CardView].init(repeating: CardView(), count: touples.count)
        initMainLabel(mainText)
        
        for i in 0 ..< touples.count{
            cards[i] = initCard(title: touples[i].title, description: touples[i].description, at: i)
            cards[i].backgroundColor = UIColor(red: 0.8745, green: 0.8863, blue: 0.851, alpha: 1.0)
        }
        
    }
    
    func initMainLabel(_ txt: String){
        let origin = CGPoint(x: 20, y: 50)
        
        mainLabel.text = txt
        mainLabel.textAlignment = .left
        mainLabel.textColor = .black
        mainLabel.font = UIFont(name: "GillSans-SemiBold", size: 20)!
        mainLabel.sizeToFit()
        
        mainLabel.frame = CGRect(origin: origin, size: mainLabel.frame.size)
        
        self.addSubview(mainLabel)
    }
    
    func initCard(title: String, description: String, at: Int)-> CardView{
        
        var lab = UILabel()
        let cardMargin : CGFloat = 15
        
        if let l = secondaryLabel {
            lab = l
        } else {
            lab = mainLabel
        }
        
        
        let wid = (UIScreen.main.bounds.width - 2*lab.frame.minX - cardMargin)/2
        let xpos = lab.frame.origin.x + CGFloat(at%2)*(wid+cardMargin)
        let nNum : Int = at/2
        let ypos = lab.frame.maxY + 50  + CGFloat(nNum)*(cardMargin+wid)
        
        let size = CGSize(width: wid, height: wid)
        let origin = CGPoint(x: xpos, y: ypos)
        
        let rect = CGRect(origin: origin, size: size)
        
        let card = CardView(frame: rect, titleTxt: title, descTxt: description)
            card.tag = at
            card.layer.cornerRadius = 10
        self.addSubview(card)
            card.addShadow()
        
        return card
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
