//
//  AppDelegate.swift
//  LorbyAuthApp
//
//  Created by Zhasmina Aitmagambetova on 04.03.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var appCoordinator: AppCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.rootViewController = UINavigationController()
        
        if let navigationController = window?.rootViewController as? UINavigationController {
            appCoordinator = AppCoordinator(navigationController: navigationController)
            appCoordinator?.showLoginScreen() // Start with the login screen
        }
        window?.makeKeyAndVisible()
        return true
    }
}

