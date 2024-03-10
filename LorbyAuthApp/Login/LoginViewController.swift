//
//  LoginViewController.swift
//  LorbyAuthApp
//
//  Created by Zhasmina Aitmagambetova on 04.03.2024.
//

import UIKit

class LoginViewController: UIViewController {

    weak var coordinator: AppCoordinator? 
    private lazy var loginView = LoginView()
    
    override func loadView() {
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
    }
    
    @objc func registerButtonTapped() {
        coordinator?.showRegisterScreen()
    }
}
