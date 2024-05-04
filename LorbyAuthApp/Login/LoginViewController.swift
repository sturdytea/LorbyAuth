//
//  LoginViewController.swift
//  LorbyAuthApp
//
//  Created by Zhasmina Aitmagambetova on 04.03.2024.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    weak var coordinator: AppCoordinator? 
    private lazy var loginView = LoginView()
    
    override func loadView() {
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = .lightBlack
        loginView.registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        loginView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    @objc func loginButtonTapped() {
        guard let email = loginView.emailField.text else { return }
        guard let password = loginView.passwordField.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { firebaseResult, error in
            if let e = error {
                print("error")
            } else {
                self.coordinator?.showHomeScreen()
            }
        }
        
    }
    
    @objc func registerButtonTapped() {
        coordinator?.showRegisterScreen()
    }
}
