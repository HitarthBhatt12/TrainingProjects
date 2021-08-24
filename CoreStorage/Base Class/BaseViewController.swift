//
//  BaseViewController.swift
//  CoreStorage
//
//  Created by Hitarth Bhatt on 03/08/21.
//

import UIKit

class BaseViewController: UIViewController, Storyboarded {
    
    // MARK: -
    // MARK: - Variables & Declarations
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    // MARK: -
    // MARK: - ViewController Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        
    }
    
    func setupNavBar() {
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.tintColor = .white
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
        
}// End of Class
