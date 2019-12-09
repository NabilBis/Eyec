//
//  TabBarView.swift
//  Notify
//
//  Created by macos on 07/12/2019.
//  Copyright © 2019 bablo. All rights reserved.
//

import Foundation
import UIKit


class TabBarView : UIView {
    
    private var delegate : TabBarViewProtocol!
    private var tabBarButtons : [UIImageView]!
    private var buttonsCount : Int!
    private var buttonsIcons : [UIImage]!
    private var viewControllers : [UIViewController]!
    private var animationView : UIView!
    private var selectedViewController: UIViewController!
    private var selectedCenter : CGPoint!
    private var fromToController : [UIViewController]!
    
    public var  animationViewColor : UIColor {
        get {
            return animationView.backgroundColor!
        }
        set {
            animationView.backgroundColor = newValue
        }
    }
    
    
    
    
    init(frame: CGRect,cordinatorController: TabBarViewProtocol, icons: [UIImage])
    {
        super.init(frame: frame)
        
        delegate = cordinatorController
        viewControllers = cordinatorController.cordinatorViewControllers()
        buttonsCount = viewControllers.count
        tabBarButtons = [UIImageView].init(repeating: UIImageView(), count: buttonsCount!)
        
        fromToController = [UIViewController].init(repeating: UIViewController(), count: 2)
        
        selectedViewController = viewControllers[0]

        buttonsIcons = icons
        
        for but in stride(from: 0, to: buttonsCount!, by: 1){
            tabBarButtons[but] = initImageButton(imageIndex: but)
            self.addSubview(tabBarButtons[but])
        }
        
        tabBarButtons[0].image = tabBarButtons[0].image?.withRenderingMode(.alwaysTemplate)
        tabBarButtons[0].tintColor = UIColor.white
        
        animationView = UIView(frame: CGRect(origin: CGPoint(x:tabBarButtons[0].frame.origin.x-8, y:tabBarButtons[0].frame.origin.y-8), size: CGSize(width: tabBarButtons[0].frame.width+16, height: tabBarButtons[0].frame.width+16)))

        animationView.backgroundColor = .yellow
        animationView.layer.cornerRadius = animationView.frame.width/2
        
        self.insertSubview(animationView, at: 0)
       
    }
    
    
    
    
    
    func initImageButton(imageIndex at : Int) -> UIImageView {
        
        let height = self.frame.height * 0.6
        let size = CGSize(width: height, height: height)
        let portion = self.frame.width/CGFloat(buttonsCount)
        let xPosition : CGFloat = (portion - size.width)/2 + portion*CGFloat(at)
        let origin = CGPoint(x: xPosition, y: (self.frame.height-height)/2)
        let imageButton = UIImageView(frame: CGRect(origin: origin, size: size))
           imageButton.isUserInteractionEnabled = true
           imageButton.contentMode = .redraw
           imageButton.clipsToBounds = true
           imageButton.layer.masksToBounds = true
        
           imageButton.image = buttonsIcons[at]
           imageButton.tag = at
           imageButton.addGestureRecognizer(buttonGesture())
        
        return imageButton
    }
    
    
    
    
    func buttonGesture() -> UITapGestureRecognizer {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labTapped))
        return tapGesture
    }
    
    @objc func labTapped(_ sender : UITapGestureRecognizer) {
        if let view = sender.view as? UIImageView  {
            
            if (view.center != selectedCenter) {
                
                fromToController[0] = selectedViewController
                fromToController[1] = viewControllers[view.tag]
                selectedViewController = viewControllers[view.tag]

                delegate.doYourThing(fromToController as [UIViewController])
 
                selectedCenter = tabBarButtons[view.tag].center
                UIView.animate(withDuration: 0.2, animations:
                    {
                        self.animationView.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
                        view.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                        self.animationView.center = self.selectedCenter
                   }) {
                    if $0 { self.animationView.transform = CGAffineTransform(scaleX: 1, y: 1)
                        view.transform = CGAffineTransform(scaleX: 1, y: 1)
                        for u in self.tabBarButtons {
                            u.image = u.image?.withRenderingMode(.alwaysTemplate)
                            u.tintColor = UIColor.black
                        }
                        view.image = view.image?.withRenderingMode(.alwaysTemplate)
                        view.tintColor = UIColor.white
                        
                    }
                }
            }}}
    
    

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
