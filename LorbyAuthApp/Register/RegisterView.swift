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
    
    let emailField = PrimaryTextField("Введи адрес почты")
    let createPasswordField = PrimaryTextField("Создай пароль", isHidden: true)
    let repeatPasswordField = PrimaryTextField("Повтори пароль", isHidden: true)
    let button = PrimaryButton("Далее", isEnabled: false)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupViews()
        setupConstraints()
        createPasswordField.addTarget(self, action: #selector(createPasswordTextFieldDidChange), for: .editingChanged)
        repeatPasswordField.addTarget(self, action: #selector(repeatPasswordTextFieldDidChange), for: .editingChanged)
        [emailField, createPasswordField, repeatPasswordField].forEach({$0.addTarget(self, action: #selector(allTextFieldsDidChange), for: .editingChanged)})
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
        scrollStack.addArrangedSubview(createPasswordField)
        setupHints()
        scrollStack.addArrangedSubview(repeatPasswordField)
        scrollStack.addArrangedSubview(button)
    }
    
    // Enables button if all textFields are fullfilled
    @objc func allTextFieldsDidChange() {
        guard
            let email = emailField.text, !email.isEmpty,
            let password = createPasswordField.text, !password.isEmpty,
            let repeatPassword = repeatPasswordField.text, !repeatPassword.isEmpty
        else {
            button.isEnabled = false
            return
        }
        button.isEnabled = true
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

// MARK: - Password Validation
private extension RegisterView {
    
    @objc func createPasswordTextFieldDidChange(_ textField: UITextField) {
        let isValid = isValidPassword()
        checkValidation(string: createPasswordField.text)
        print(isValid)
    }
    
    @objc func repeatPasswordTextFieldDidChange(_ textField: UITextField) {
        let isRepeating = isRepeatingPassword()
        print("Repeat? \(isRepeating)")
    }
    
    func isValidPassword() -> Bool {
        let passwordRegex = "^(?=.*[A-Z])(?=.*[!@#$&*])(?=.*[0-9])(?=.*[a-z]).{8,15}$"
        let passwordCheck = NSPredicate(format: "SELF MATCHES %@",passwordRegex)
        return passwordCheck.evaluate(with: createPasswordField.text)
    }
    
    func isRepeatingPassword() -> Bool {
        if createPasswordField.text == repeatPasswordField.text {
            return true
        }
        return false
    }
    
    func checkValidation(string: String?) {
        if (NSPredicate(format: "SELF MATCHES %@", ".*[A-Z]+.*").evaluate(with: string)) && (!NSPredicate(format: "SELF MATCHES %@", ".*[a-z]+.*").evaluate(with: string)) {
            PasswordHintLabel(Hint.letterCases.rawValue).changeTextColor(color: .green)
        }
    }
}

// MARK: - PasswordHintLabel
class PasswordHintLabel: UILabel {
    
    let checkEmoji = "✅"
    let crossEmoji = "❌"
    
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
    
    public func changeTextColor(color: UIColor) {
        textColor = color
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
