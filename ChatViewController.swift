//
//  ChatViewController.swift
//  Notify
//
//  Created by macos on 14/12/2019.
//  Copyright © 2019 bablo. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        let fram = CGRect(x: 0, y: 0, width: view.frame.width, height: 222)
        let chatView = ChatView(frame: fram, searchBarDelegate: self)
//         chatView.backgroundColor = .blue
        self.view.addSubview(chatView)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
