//
//  LargeTitle.swift
//  LorbyAuthApp
//
//  Created by Zhasmina Aitmagambetova on 10.03.2024.
//

import UIKit

class LargeTitle: UILabel {
    
    init(_ text: String) {
        super.init(frame: .zero)
        configure(text)
    }
    
    private func configure(_ inputText: String) {
        font = .customFont(.medium, size: 24)
        numberOfLines = 0
        text = inputText
        textAlignment = .center
        textColor = .darkGray
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
