//
//  AddUserCoordinator.swift
//  CoreStorage
//
//  Created by Hitarth Bhatt on 03/08/21.
//

import UIKit

class AddUserCoordinator: Coordinator {
    
    var childCoordinator: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        
        self.navigationController = navigationController

    }
    
    func start() {
        let addUserVC = AddUserVC.instantiate(from: .addUser)
        addUserVC.coordinator = self
        navigationController.present(addUserVC, animated: true, completion: nil)
        
    }
    
}
