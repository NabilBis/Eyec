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

        let t = [("Invitation", "Make sure only guests\n get in"), ("Message", "Leave a message"), ("Attendance", "Create a ")]
        let createView = CreateView(frame: self.view.bounds, mainText: "Give a meaning to an image", touples: t)
        
        self.view.addSubview(createView)
        // Do any additional setup after loading the view.
    }


}
