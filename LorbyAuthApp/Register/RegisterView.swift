//
//  RegisterView.swift
//  LorbyAuthApp
//
//  Created by Zhasmina Aitmagambetova on 07.03.2024.
//

import UIKit

enum Hint: String, CaseIterable {
    case length         = "От 8 до 15 символов"
    case letterCases    = "Строчные и прописные буквы"
    case numbers        = "Минимум 1 цифра"
    case symbols        = "Минимум 1 спецсимвол (!, \", #, $...)"
}

class RegisterView: UIView {
    
    let title = LargeTitle("Создать аккаунт \nLorby")
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let scrollStack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 16
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let emailField = PrimaryTextField("Введи адрес почты")
    private let loginField = PrimaryTextField("Придумай логин")
    private let createPasswordField = PrimaryTextField("Создай пароль", isHidden: true)
    private let repeatPasswordField = PrimaryTextField("Повтори пароль", isHidden: true)
    private let button = PrimaryButton("Далее", isEnabled: false)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        addSubview(title)
        addSubview(scrollView)
        scrollView.addSubview(scrollStack)
        configureStackView()
    }
    
    private func setupHints() {
        for hint in Hint.allCases {
            scrollStack.addArrangedSubview(PasswordHintLabel(hint.rawValue))
        }
    }
    
    private func configureStackView() {
        scrollStack.addArrangedSubview(emailField)
        scrollStack.addArrangedSubview(loginField)
        scrollStack.addArrangedSubview(createPasswordField)
        setupHints()
        scrollStack.addArrangedSubview(repeatPasswordField)
        scrollStack.addArrangedSubview(button)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension RegisterView {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 32),
            
            scrollView.centerXAnchor.constraint(equalTo: centerXAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            scrollView.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 32),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            scrollStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            scrollStack.centerYAnchor.constraint(equalTo: centerYAnchor),
            scrollStack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
        ])
    }
}

class PasswordHintLabel: UILabel {
    
    let checkEmoji = "✅"
    
    init(_ text: String) {
        super.init(frame: .zero)
        configure(text)
    }
    
    private func configure(_ hintText: String) {
        font = .customFont(.medium, size: 12)
        text = "\u{2022} " + hintText
        textAlignment = .left
        textColor = .mediumGray
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
