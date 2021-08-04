//
//  StoryBoarded.swift
//  MVVM
//
//  Created by Hitarth Bhatt on 23/07/21.
//

import UIKit

enum Storyboard: String {
    
    case home = "Home"
    case addUser = "AddUser"
}

protocol Storyboarded {
    static func instantiate(from storyboard: Storyboard) -> Self
}

extension Storyboarded where Self: UIViewController {
    
    static func instantiate(from storyboard: Storyboard) -> Self {
        
        let fullName = NSStringFromClass(self)
       
        print(fullName.components(separatedBy: "."))
        let className = fullName.components(separatedBy: ".")[1]
        
        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: Bundle.main)
        
        guard let board = storyboard.instantiateViewController(withIdentifier: className) as? Self else {
            return Self()
            
        }
        
        return board
        
    }
    
}
