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
        view.addSubview(scanView)
    }



}

