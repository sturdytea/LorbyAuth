//
//  HomeViewController.swift
//  LorbyAuthApp
//
//  Created by Zhasmina Aitmagambetova on 27.03.2024.
//

import UIKit

class HomeViewController: UIViewController {
    weak var coordinator: AppCoordinator?
    private lazy var homeView = HomeView()
    
    override func loadView() {
        view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeView.button.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
    }
    
    @objc func logoutButtonTapped() {
        coordinator?.showLoginScreen()
    }
}
