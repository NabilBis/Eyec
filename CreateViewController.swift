//
//  CreateViewController.swift
//  Notify
//
//  Created by macos on 09/12/2019.
//  Copyright © 2019 bablo. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {
    public var hintView : HintSearchBarView!
    
    let fakeData = ["bladi", "blatista", "blavisa", "acra", "acti", "Bavaria"]
    override func viewDidLoad() {
        super.viewDidLoad()

//        let t = [("Invitation", "Make sure only guests\n get in"), ("Message", "Leave a message"), ("Attendance", "Create a ")]
//        let createView = CreateView(frame: self.view.bounds, mainText: "Give a meaning to an image", touples: t)
//        
//        self.view.addSubview(createView)
        
        
        let size = CGSize(width: UIScreen.main.bounds.width * 0.7, height: 40)
        let origin = CGPoint(x: (UIScreen.main.bounds.width - size.width)/2, y: 44/*(UIScreen.main.bounds.height - size.height)/2*/)
        
        hintView = HintSearchBarView(frame: CGRect(origin: origin, size: size), textFieldDelegate: self)
        hintView.layer.cornerRadius = 4
        self.view.addSubview(hintView)
    }
    
    
    public func stringContains(string: String) -> [String] {
        var hints = [String]()

        if(string.characters.count == 0){
            return hints
        }
        hints = fakeData.filter { $0.lowercased().hasPrefix(string.lowercased()) }
        print(string)
        return hints
    }

}




extension CreateViewController : UITextFieldDelegate {
    
    /*
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if let tezt = textField.text {
            self.hintView.dataMutator = stringContains(string: tezt)
        }
    }
    */
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
     /*   if (string.characters.count < 2){
            self.hintView.dataMutator = stringContains(string: string)
        } else {
            self.hintView.dataMutator = stringContains(string: textField.text!)
        }
       */
        
        if let text = textField.text {
//            print(text)
//            if(text.characters.count == 0){
//                self.hintView.dataMutator = stringContains(string: string)
//            } else {
            self.hintView.dataMutator = stringContains(string: text+string)
//            }
        }
        
        if(string == "\n"){
            textField.resignFirstResponder()
        }
        
        return true
    }
    
}
