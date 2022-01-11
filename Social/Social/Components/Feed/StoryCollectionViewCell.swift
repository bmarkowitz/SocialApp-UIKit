//
// StoryCollectionViewCell.swift
// Social
//
// Created by Brett Markowitz on 1/9/22.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    
    private let avatarView = AvatarView(height: 64, width: 64)
    private let nameLabel = UILabel()
    
    private let stackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        style()
        constrain()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func configure() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 4
        
        stackView.addArrangedSubview(avatarView)
        stackView.addArrangedSubview(nameLabel)
        contentView.addSubview(stackView)
    }
    
    private func style() {
        nameLabel.font = .preferredFont(forTextStyle: .caption1)
        nameLabel.textColor = .secondaryLabel
        nameLabel.text = "Brett"
    }
    
    private func constrain() {
        // Giving these a priority silences some auto layout complaints
        let trailingConstraint = stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        trailingConstraint.priority = .init(rawValue: 999)
        
        let bottomConstraint = stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        bottomConstraint.priority = .init(rawValue: 999)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            trailingConstraint,
            bottomConstraint
        ])
    }
}
