//
//  SwitchViewController.swift
//  Notify
//
//  Created by macos on 07/12/2019.
//  Copyright © 2019 bablo. All rights reserved.
//

import UIKit

class SwitchViewController: UIViewController {

    public var firstViewController: UIViewController!
    public var secondViewController: UIViewController!
    public var thirdViewController: UIViewController!{
        didSet {
            addChildViewController(thirdViewController)
            view.insertSubview(thirdViewController.view, at: 0)
        }
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let storyboard = self.storyboard {
            firstViewController = storyboard.instantiateViewController(withIdentifier: "FirstView")
            secondViewController = storyboard.instantiateViewController(withIdentifier: "SecondView")
            thirdViewController = storyboard.instantiateViewController(withIdentifier: "ThirdView")
        }
        
        ////////////////////
        let ico : [UIImage] = [UIImage(named: "qbar")!, UIImage(named: "chat")!, UIImage(named: "add")!]
        let rect = CGRect(x: 0, y: UIScreen.main.bounds.height-50, width: view.frame.width, height: 50)
        let vv = TabBarView(frame: rect, cordinatorController: self, icons: ico)
            vv.backgroundColor = UIColor(red: 0.8392, green: 0.8118, blue: 0.7882, alpha: 1.0)
            vv.animationViewColor = UIColor(red: 0.5176, green: 0.4, blue: 0.502, alpha: 1.0)
        
        view.addSubview(vv)
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
        return [ thirdViewController, firstViewController, secondViewController]
    }
    
    func doYourThing(_ params: [Any]?) {
        if let params = params as! [UIViewController]? {
            switchViewController(from: params[0], to: params[1])
        }
    }
}
