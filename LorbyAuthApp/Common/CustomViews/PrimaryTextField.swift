//
//  PrimaryTextField.swift
//  LorbyAuthApp
//
//  Created by Zhasmina Aitmagambetova on 07.03.2024.
//

import UIKit

class PrimaryTextField: UITextField {
    
    let padding = UIEdgeInsets(top: 13, left: 16, bottom: 13, right: 16)
    
    init(_ text: String) {
        super.init(frame: .zero)
        configure(text)
    }
    
    private func configure(_ text: String) {
        attributedPlaceholder = NSAttributedString(string: text, attributes: placeholderAttributes())
        backgroundColor = .lightGray
        borderStyle = .none
        layer.cornerRadius = 12
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 52)
        ])
    }
    
    private func placeholderAttributes() -> [NSAttributedString.Key: Any] {
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.mediumGray,
            .font: UIFont.customFont(.medium, size: 16)
        ]
        return placeholderAttributes
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
