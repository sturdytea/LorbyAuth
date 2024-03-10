//
//  RegisterViewController.swift
//  LorbyAuthApp
//
//  Created by Zhasmina Aitmagambetova on 07.03.2024.
//

import UIKit

class RegisterViewController: UIViewController {

    weak var coordinator: AppCoordinator?
    private lazy var registerView = RegisterView()
    
    override func loadView() {
        view = registerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar(title: "Регистрация")
    }
    
    private func setupNavigationBar(title: String) {
        let titleLabel = UILabel()
        titleLabel.font = .customFont(.medium, size: 16)
        titleLabel.text = title
        titleLabel.textColor = .lightBlack
        
        navigationItem.titleView = titleLabel
    }
}
