//
//  AppCoordinator.swift
//  LorbyAuthApp
//
//  Created by Zhasmina Aitmagambetova on 10.03.2024.
//

import UIKit

protocol Coordinator: AnyObject {
    func showLoginScreen()
    func showRegisterScreen()
    func showHomeScreen()
}

class AppCoordinator: Coordinator {
    
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController? = nil) {
        self.navigationController = navigationController
    }
    
    func showLoginScreen() {
        let loginViewController = LoginViewController()
        loginViewController.coordinator = self
        navigationController?.pushViewController(loginViewController, animated: true)
    }
    
    func showRegisterScreen() {
        let registerViewController = RegisterViewController()
        registerViewController.coordinator = self
        navigationController?.pushViewController(registerViewController, animated: true)
    }
    
    func showHomeScreen() {
        let homeViewController = HomeViewController()
        homeViewController.coordinator = self
        navigationController?.pushViewController(homeViewController, animated: true)
    }
}
