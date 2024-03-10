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
        view.backgroundColor = .purple
    }
}
