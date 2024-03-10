//
//  LoginView.swift
//  LorbyAuthApp
//
//  Created by Zhasmina Aitmagambetova on 04.03.2024.
//

import UIKit

class LoginView: UIView {
    
    let image: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "globe")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let welcomeText: UILabel = {
        let label = UILabel()
        label.font = .customFont(.medium, size: 24)
        label.text = "Вэлком бэк!"
        label.textAlignment = .center
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let loginField = PrimaryTextField("Введи туда-сюда логин")
    let passwordField = PrimaryTextField("Пароль (тоже введи)")
    let loginButton = PrimaryButton("Войти")
    let registerButton = SecondaryButton("У меня еще нет аккаунта")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        addSubview(image)
        addSubview(welcomeText)
        addSubview(loginField)
        addSubview(passwordField)
        addSubview(loginButton)
        addSubview(registerButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension LoginView {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 68),
            image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 94),
            image.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            welcomeText.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 32),
            welcomeText.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            loginField.topAnchor.constraint(equalTo: welcomeText.bottomAnchor, constant: 32),
            loginField.centerXAnchor.constraint(equalTo: centerXAnchor),
            loginField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            passwordField.topAnchor.constraint(equalTo: loginField.bottomAnchor, constant: 16),
            passwordField.centerXAnchor.constraint(equalTo: centerXAnchor),
            passwordField.leadingAnchor.constraint(equalTo: loginField.leadingAnchor),

            loginButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 24),
            loginButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            loginButton.leadingAnchor.constraint(equalTo: passwordField.leadingAnchor),

            registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 24),
            registerButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            registerButton.leadingAnchor.constraint(equalTo: loginButton.leadingAnchor),
        ])
    }
}
