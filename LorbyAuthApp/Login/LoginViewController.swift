//
//  LoginViewController.swift
//  LorbyAuthApp
//
//  Created by Zhasmina Aitmagambetova on 04.03.2024.
//

import UIKit

class LoginViewController: UIViewController {

    private lazy var loginView = LoginView()
    
    override func loadView() {
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
    }
    
    
}
