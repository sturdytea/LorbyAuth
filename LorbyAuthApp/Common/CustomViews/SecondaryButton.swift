//
//  SecondaryButton.swift
//  LorbyAuthApp
//
//  Created by Zhasmina Aitmagambetova on 10.03.2024.
//

import UIKit

class SecondaryButton: UIButton {
    
    init(_ text: String) {
        super.init(frame: .zero)
        configure(text)
    }
    
    private func configure(_ text: String) {
        var buttonConfig = UIButton.Configuration.plain()
        buttonConfig.contentInsets = NSDirectionalEdgeInsets(top: 13, leading: 16, bottom: 13, trailing: 16)
        configuration = buttonConfig
        
        backgroundColor = .none
        contentHorizontalAlignment = .center
        translatesAutoresizingMaskIntoConstraints = false
        tintColor = .darkGray
        titleLabel?.font = .customFont(.medium, size: 16)
        setTitle(text, for: .normal)
        setTitleColor(.lightBlack, for: .normal)
        layer.cornerRadius = 12
        
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
