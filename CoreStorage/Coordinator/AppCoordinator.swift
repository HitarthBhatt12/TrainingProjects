//
//  AppCoordinator.swift
//  MVVM
//
//  Created by Hitarth Bhatt on 23/07/21.
//

import UIKit

class AppCoordinator: Coordinator {
    
    var childCoordinator: [Coordinator] = []
    var navigationController: UINavigationController
    
    var window: UIWindow
    
    init(navigationController: UINavigationController, window: UIWindow) {
        
        self.navigationController = navigationController
        self.window = window

    }
    
    func start() {
            goToHome()
    }
    
    func goToHome() {
        let homeCoordinator = HomeCoordinator(navigationController: navigationController)
        self.window.rootViewController = navigationController
        homeCoordinator.start()
    }
    
}
