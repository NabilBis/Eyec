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
        view.addSubview(proView)
        // Do any additional setup after loading the view.
    }

}
