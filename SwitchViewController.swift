//
//  SwitchViewController.swift
//  Notify
//
//  Created by macos on 07/12/2019.
//  Copyright © 2019 bablo. All rights reserved.
//

import UIKit

class SwitchViewController: UIViewController {

    public var chatViewController : UIViewController!
    public var createViewController: UIViewController!
    public var defaultViewController : UIViewController!{
        didSet {
            addChildViewController(defaultViewController)
            view.insertSubview(defaultViewController.view, at: 0)
        }
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let storyboard = self.storyboard {
            defaultViewController = storyboard.instantiateViewController(withIdentifier: "DefaultView")
            createViewController = storyboard.instantiateViewController(withIdentifier: "CreateView")
            chatViewController = storyboard.instantiateViewController(withIdentifier: "ChatView")
        }
        
        ////////////////////
        let tabViewIcons : [UIImage] = [UIImage(named: "chat")!, UIImage(named: "qbar")!, UIImage(named: "add")!]
        let rect = CGRect(x: 0, y: UIScreen.main.bounds.height-50, width: view.frame.width, height: 50)
        let tabView = TabBarView(frame: rect, cordinatorController: self, icons: tabViewIcons)
        
           tabView.backgroundColor = UIColor(red: 0.8392, green: 0.8118, blue: 0.7882, alpha: 1.0)
           tabView.animationViewColor = UIColor(red: 0.5176, green: 0.4, blue: 0.502, alpha: 1.0)
        
        view.addSubview(tabView)
    }

    
    public func switchViewController(from: UIViewController, to: UIViewController)
    {
        from.view.removeFromSuperview()
        from.removeFromParentViewController()        
        addChildViewController(to)
        view.insertSubview(to.view, at: 0)
    }
}


extension SwitchViewController: TabBarViewProtocol {
    
    func cordinatorViewControllers() -> [UIViewController] {
        return [chatViewController, defaultViewController,  createViewController]
    }
    
    func doYourThing(_ params: [Any]?) {
        if let params = params as! [UIViewController]? {
            switchViewController(from: params[0], to: params[1])
        }
    }
}
