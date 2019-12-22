//
//  ProfileViewController.swift
//  Notify
//
//  Created by macos on 08/12/2019.
//  Copyright © 2019 bablo. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let proView = ProfileView(frame: view.bounds)
        
        proView.dismissLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissGesture)))
        view.addSubview(proView)
        view.backgroundColor = .clear
        view.addBlurEffect()
//        proView.backgroundColor = UIColor.blue.withAlphaComponent(0.2)
//        print("-----\(self.modalPresentationStyle)")
    }

    @objc func dismissGesture(){
        dismiss(animated: true, completion: nil)
    }
}
