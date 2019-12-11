//
//  SegmentationView.swift
//  Notify
//
//  Created by macos on 08/12/2019.
//  Copyright © 2019 bablo. All rights reserved.
//

import Foundation
import UIKit


class SegementationView : UIView{
    public var scrollViews : [UIScrollView]!
    private var buttonViews : [UIView]!
    private var portionView : UIView!
    public var imgViews : [UIImageView]!
//    public var delegate : UIScrollViewDelegate!
    private var buttonsNumber : Int!
    private var selectedImgTag : Int!
    private var color : [UIColor]!
    
    
    init(frame: CGRect, buttonIcon ico: [UIImage?]){
        super.init(frame: frame)
        
        buttonsNumber = ico.count
        scrollViews = [UIScrollView].init(repeating: UIScrollView(), count: buttonsNumber)
        buttonViews = [UIView].init(repeating: UIView(), count: buttonsNumber)
        imgViews = [UIImageView].init(repeating: UIImageView(), count: buttonsNumber)
        
        
        color = [.brown, .green, .red, UIColor(red: 0.7647, green: 0.8902, blue: 0.9569, alpha: 1.0)]
        
        for i in stride(from: 0, to: buttonsNumber, by: 1){
            buttonViews[i] = initPortionView(at: i)
            portionView = buttonViews[i]
            imgViews[i] = initImg(image: ico[i]!, at: i)
            scrollViews[i] = initScrollView(at: i)
            scrollViews[i].backgroundColor = color[i]
        }
        selectedImgTag = 0
        imgViews[0].backgroundColor = .brown
        self.addSubview(scrollViews[selectedImgTag])
        self.layer.masksToBounds = true
    }
    

    
    func initPortionView(at: Int) -> UIView{
        
        let portion = self.frame.width/CGFloat(buttonsNumber)
        let size = CGSize(width: portion, height: self.frame.height * 0.1)
        let origin = CGPoint(x: portion * CGFloat(at), y: 0)
        
        
        let vie = UIView(frame: CGRect(origin: origin, size: size))
        
//        let butSize = CGSize(width: size.height * 0.9, height: size.height * 0.9)
//        let butOrigin = CGPoint(x: (size.width - butSize.width)/2, y: size.height * 0.05)
//        
//        let img = UIImageView(frame: CGRect(origin: butOrigin, size: butSize))
//        
//            img.tag = at
//            img.isUserInteractionEnabled = true
//            img.contentMode = .scaleAspectFit
//            img.image = image
//            img.layer.masksToBounds = true
//            img.layer.cornerRadius = butSize.width/2
//            img.layer.borderWidth = 1
//            img.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(butTapped(_:))))
//            img.backgroundColor = .white
//        
//        vie.addSubview(img)
        self.addSubview(vie)
        
        return vie
        
    }
    
    func initImg(image: UIImage, at: Int) -> UIImageView {
        
        let butSize = CGSize(width: portionView.frame.height * 0.9, height: portionView.frame.height * 0.9)
        let butOrigin = CGPoint(x: (portionView.frame.width - butSize.width)/2, y: portionView.frame.height * 0.05)
        
        let img = UIImageView(frame: CGRect(origin: butOrigin, size: butSize))
        
        img.tag = at
        img.isUserInteractionEnabled = true
        img.contentMode = .scaleAspectFit
        img.image = image
        img.layer.masksToBounds = true
        img.layer.cornerRadius = butSize.width/2
//        img.layer.borderWidth = 1
        img.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(butTapped(_:))))
        img.backgroundColor = .white
        
        //////// Shadow
//        let shadowView = UIView(frame: img.frame)
//        
//        shadowView.layer.backgroundColor = UIColor.black.cgColor
//        shadowView.layer.shadowColor = UIColor.white.cgColor
//        shadowView.layer.shadowOffset = CGSize(width: 6, height: 1.0)
//        shadowView.layer.shadowOpacity = 0.4
//        shadowView.layer.shadowRadius = 4.0
//        shadowView.layer.masksToBounds = false
//        shadowView.layer.cornerRadius = img.layer.cornerRadius
        
//        portionView.addSubview(shadowView)
        
        portionView.addSubview(img)
        img.addShadow(color: .white)
        return img
    }
    
    
    func initScrollView(at: Int) -> UIScrollView {
        let scrlSize = CGSize(width: self.frame.width, height: self.frame.height - self.frame.height * 0.15)
        let scrlOrigin = CGPoint(x: 0, y: self.frame.height * 0.15)
        let scrollView = UIScrollView(frame:CGRect(origin: scrlOrigin, size: scrlSize))
        //        scrollView.delegate = delegate
        scrollView.tag = at
        
        return scrollView
        
    }
    @objc func butTapped(_ sender: UITapGestureRecognizer){
        if let view = sender.view {
            if(view.tag != selectedImgTag){
                scrollViews[selectedImgTag].removeFromSuperview()
                self.addSubview(scrollViews[view.tag])
                selectedImgTag = view.tag
                
                for i in 0 ..< buttonsNumber{
                    imgViews[i].backgroundColor = .white
                }
                view.backgroundColor = color[view.tag]
                self.setNeedsDisplay()
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
