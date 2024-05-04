//
//  RegisterViewController.swift
//  LorbyAuthApp
//
//  Created by Zhasmina Aitmagambetova on 07.03.2024.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {

    weak var coordinator: AppCoordinator?
    private lazy var registerView = RegisterView()
    
    override func loadView() {
        view = registerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar(title: "Регистрация")
        registerView.button.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
    }
    
    private func setupNavigationBar(title: String) {
        let titleLabel = UILabel()
        titleLabel.font = .customFont(.medium, size: 16)
        titleLabel.text = title
        titleLabel.textColor = .lightBlack
        
        navigationItem.titleView = titleLabel
    }
    
    @objc
    func registerButtonTapped() {
        guard let email = registerView.emailField.text else { return }
        guard let password = registerView.createPasswordField.text else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { firebaseResult, error in
            if let e = error {
                print("error")
            } else {
                self.coordinator?.showHomeScreen()
            }
        }
    }
}
