//
//  Coordinator.swift
//  MVVM
//
//  Created by Hitarth Bhatt on 23/07/21.
//

import UIKit

protocol Coordinator: AnyObject {
    
    var childCoordinator: [Coordinator] {get set}
    var navigationController: UINavigationController {get set}
    
    func start()
    
}
