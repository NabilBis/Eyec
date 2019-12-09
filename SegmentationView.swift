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
    public var imgViews : [UIImageView]!
    public var scrollViews : [UIScrollView]!
//    public var delegate : UIScrollViewDelegate!
    private var buttonsNumber : Int!
    private var selectedImgTag : Int!
    
    
    
    init(frame: CGRect, buttonIcon ico: [UIImage?]){
        super.init(frame: frame)
        
        imgViews = [UIImageView].init(repeating: UIImageView(), count: ico.count)
        scrollViews = [UIScrollView].init(repeating: UIScrollView(), count: ico.count)
        buttonsNumber = ico.count
        
        let color : [UIColor] = [.brown, .green, .red]
        for i in stride(from: 0, to: buttonsNumber, by: 1){
            imgViews[i] = initImgView( image: ico[i]!, at: i)
            scrollViews[i] = initScrollView(at: i)
            scrollViews[i].backgroundColor = color[i]
            imgViews[i].backgroundColor = color[i]
        }
        selectedImgTag = 0
        self.addSubview(scrollViews[selectedImgTag])
        self.layer.masksToBounds = true
        self.backgroundColor = .yellow
    }
    
    func initImgView(image: UIImage, at: Int) -> UIImageView{
        
        let portion = self.frame.width/CGFloat(buttonsNumber)
        let size = CGSize(width: portion, height: self.frame.height * 0.1)
        let origin = CGPoint(x: portion * CGFloat(at), y: 0)
        
        
        let imgView = UIImageView(frame: CGRect(origin: origin, size: size))
        imgView.tag = at
        imgView.isUserInteractionEnabled = true
        imgView.contentMode = .redraw
        imgView.image = image
//        imgView.backgroundColor = .green
        imgView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(butTapped(_:))))
        
        self.addSubview(imgView)
        
        return imgView
        
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
                self.setNeedsDisplay()
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
