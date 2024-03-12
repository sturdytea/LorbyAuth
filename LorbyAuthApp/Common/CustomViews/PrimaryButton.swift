//
//  PrimaryButton.swift
//  LorbyAuthApp
//
//  Created by Zhasmina Aitmagambetova on 10.03.2024.
//

import UIKit

class PrimaryButton: UIButton {
    
    init(_ text: String, isEnabled: Bool = true) {
        super.init(frame: .zero)
        configure(text, isEnabled)
    }
    
    private func configure(_ text: String, _ enableStatus: Bool) {
        var buttonConfig = UIButton.Configuration.plain()
        buttonConfig.contentInsets = NSDirectionalEdgeInsets(top: 13, leading: 16, bottom: 13, trailing: 16)
        configuration = buttonConfig
        
        backgroundColor = .lightBlack
        contentHorizontalAlignment = .center
        translatesAutoresizingMaskIntoConstraints = false
        tintColor = .lightGray
        setTitle(text, for: .normal)
        titleLabel?.font = .customFont(.medium, size: 16)
        setTitleColor(.lightGray, for: .normal)
        layer.cornerRadius = 12
        isEnabled = enableStatus
        
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    override var isEnabled: Bool {
        didSet {
            if self.isEnabled == false {
                backgroundColor = .lightButton
                setTitleColor(.mediumGray, for: .normal)
            } else {
                backgroundColor = .lightBlack
                setTitleColor(.lightGray, for: .normal)
            }
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
