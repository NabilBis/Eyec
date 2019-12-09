//
//  TabBarViewProtocol.swift
//  Notify
//
//  Created by macos on 07/12/2019.
//  Copyright © 2019 bablo. All rights reserved.
//

import Foundation
import UIKit


protocol  TabBarViewProtocol {
    func cordinatorViewControllers() -> [UIViewController]
    func doYourThing(_ params: [Any]?) -> Void
}
