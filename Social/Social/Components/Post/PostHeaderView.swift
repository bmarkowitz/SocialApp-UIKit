//
// PostHeaderView.swift
// Social
//
// Created by Brett Markowitz on 1/9/22.
//

import UIKit

class PostHeaderView: UIView {
    private let avatarView = AvatarView()
    private let usernameLabel = UILabel()
    private let infoLabel = UILabel()
    
    private let horizontalStackView = UIStackView()
    private let verticalStackView = UIStackView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        style()
        constrain()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        horizontalStackView.axis = .horizontal
        horizontalStackView.alignment = .center
        horizontalStackView.distribution = .fill
        horizontalStackView.spacing = 8
        
        verticalStackView.axis = .vertical
        verticalStackView.alignment = .leading
        verticalStackView.spacing = 2
        
        verticalStackView.addArrangedSubview(usernameLabel)
        verticalStackView.addArrangedSubview(infoLabel)
        
        horizontalStackView.addArrangedSubview(avatarView)
        horizontalStackView.addArrangedSubview(verticalStackView)
        
        addSubview(horizontalStackView)
    }
    
    private func style() {
        usernameLabel.font = UIFont.boldPreferredFont(forTextStyle: .subheadline)
        usernameLabel.text = "Brett Markowitz"
        
        infoLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        infoLabel.textColor = .secondaryLabel
        infoLabel.text = "@brett_0 · 1h"
    }
    
    private func constrain() {
        NSLayoutConstraint.activate([
            horizontalStackView.topAnchor.constraint(equalTo: topAnchor),
            horizontalStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            horizontalStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            horizontalStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
