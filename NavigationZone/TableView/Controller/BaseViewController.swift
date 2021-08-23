//
//  BaseViewController.swift
//  NavigationZone
//
//  Created by Hitarth Bhatt on 05/08/21.
//

import UIKit

class BaseViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNav()
    }
        
    func setupNav() {
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
}
