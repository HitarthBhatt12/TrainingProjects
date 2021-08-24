//
//  HomeCoordinator.swift
//  MVVM
//
//  Created by Hitarth Bhatt on 23/07/21.
//

import UIKit

class HomeCoordinator: Coordinator {
    
    var childCoordinator: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        
        self.navigationController = navigationController

    }
    
    func start() {
        let homeVC = HomeVC.instantiate(from: .home)
        homeVC.coordinator = self
        navigationController.viewControllers = [homeVC]
        
    }
    
    func goToAddUser() {
        let adduserCoordinator = AddUserCoordinator(navigationController: navigationController)
        adduserCoordinator.start()
    }
    
}
