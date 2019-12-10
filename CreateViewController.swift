//
//  CreateViewController.swift
//  Notify
//
//  Created by macos on 09/12/2019.
//  Copyright © 2019 bablo. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let t = [("Living room", "3 family members have\n access"), ("Bed room", "3 family members have\n access"), ("Guest room", "3 family members have\n access")]
        let createView = CreateView(frame: self.view.bounds, mainText: "Create your story", touples: t)
        
        self.view.addSubview(createView)
        // Do any additional setup after loading the view.
    }


}
