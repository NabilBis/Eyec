//
//  ViewController.swift
//  Notify
//
//  Created by macos on 07/12/2019.
//  Copyright © 2019 bablo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var scanView = ScanView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scanView.frame = view.bounds
        scanView.profileView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(viewNavigation)))
        
        view.addSubview(scanView)
    }

    @objc func viewNavigation()
    {
        let destinationView : UIViewController!
        
        if let storyboard = storyboard {
            destinationView = storyboard.instantiateViewController(withIdentifier: "ProfileView")
            destinationView.modalPresentationStyle = .overCurrentContext
            present(destinationView, animated: true, completion: nil)
        
//            show(destinationView, sender: self)

        }
    }
}

