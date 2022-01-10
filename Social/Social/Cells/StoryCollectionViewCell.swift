//
// StoryCollectionViewCell.swift
// Social
//
// Created by Brett Markowitz on 1/9/22.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    
    private let avatarView = AvatarView(height: 64, width: 64)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        style()
        constrain()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func configure() {
        contentView.addSubview(avatarView)
    }
    
    private func style() {
        
    }
    
    private func constrain() {
        // Giving these a priority silences some auto layout complaints
        let bottomConstraint = avatarView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        bottomConstraint.priority = .init(rawValue: 999)
        
        let trailingConstraint = avatarView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        trailingConstraint.priority = .init(rawValue: 999)
        
        NSLayoutConstraint.activate([
            avatarView.topAnchor.constraint(equalTo: contentView.topAnchor),
            avatarView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            trailingConstraint,
            bottomConstraint
        ])
    }
}
