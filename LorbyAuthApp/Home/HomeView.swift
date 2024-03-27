//
//  HomeView.swift
//  LorbyAuthApp
//
//  Created by Zhasmina Aitmagambetova on 27.03.2024.
//

import UIKit

class HomeView: UIView {
    let title = LargeTitle("С возвращением!")
    
    let desc: UILabel = {
        let label = UILabel()
        label.text = "Lorby - твой личный репетитор"
        label.textAlignment = .center
        label.font = .customFont(.regular, size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let image: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "lorby-main")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let button = SecondaryButton("Выйти")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        addSubview(title)
        addSubview(desc)
        addSubview(image)
        addSubview(button)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension HomeView {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 36),
            title.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 90),
            
            desc.centerXAnchor.constraint(equalTo: centerXAnchor),
            desc.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            desc.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 16),
            
            image.centerXAnchor.constraint(equalTo: centerXAnchor),
            image.leadingAnchor.constraint(equalTo: desc.leadingAnchor),
            image.topAnchor.constraint(equalTo: desc.bottomAnchor, constant: 56),
            
            button.centerXAnchor.constraint(equalTo: centerXAnchor),
            button.leadingAnchor.constraint(equalTo: image.leadingAnchor),
            button.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
