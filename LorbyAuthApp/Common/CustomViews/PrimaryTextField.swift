//
//  PrimaryTextField.swift
//  LorbyAuthApp
//
//  Created by Zhasmina Aitmagambetova on 07.03.2024.
//

import UIKit

class PrimaryTextField: UITextField {
    
    let padding = UIEdgeInsets(top: 13, left: 16, bottom: 13, right: 16)
    let openEyeImage = UIImage(systemName: "eye")
    let closedEyeImage = UIImage(systemName: "eye.slash")
    var eyeButton = UIButton()
    var buttonClick = true
    
    init(_ text: String, isHidden: Bool = false) {
        super.init(frame: .zero)
        configure(text, isHidden: isHidden)
    }
    
    private func configure(_ text: String, isHidden: Bool = false) {
        attributedPlaceholder = NSAttributedString(string: text, attributes: placeholderAttributes())
        backgroundColor = .lightGray
        borderStyle = .none
        layer.cornerRadius = 12
        translatesAutoresizingMaskIntoConstraints = false
        
        if isHidden {
            setupEyeButton()
            isSecureTextEntry = true
        }
        addConstraints()
    }
    
    private func placeholderAttributes() -> [NSAttributedString.Key: Any] {
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.mediumGray,
            .font: UIFont.customFont(.medium, size: 16)
        ]
        return placeholderAttributes
    }
    
    private func setupEyeButton() {
        eyeButton.addTarget(self, action: #selector(toggleTextVisibility), for: .touchUpInside)
        eyeButton.tintColor = .mediumGray
        eyeButton.translatesAutoresizingMaskIntoConstraints = false
        eyeButton.setImage(openEyeImage, for: .normal)

        addSubview(eyeButton)
        rightView = eyeButton
        rightViewMode = .always
    }
    
    @objc private func toggleTextVisibility() {
        if buttonClick {
            isSecureTextEntry = false
            eyeButton.setImage(closedEyeImage, for: .normal)
        } else {
            isSecureTextEntry = true
            eyeButton.setImage(openEyeImage, for: .normal)
        }
        buttonClick = !buttonClick
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension PrimaryTextField {
    func addConstraints() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 52),
        ])
    }
}
