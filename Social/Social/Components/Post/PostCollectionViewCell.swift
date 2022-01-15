//
// PostCollectionViewCell.swift
// Social
//
// Created by Brett Markowitz on 1/9/22.
//

import UIKit

class PostCollectionViewCell: UICollectionViewListCell {
    
    private let postCardView = PostCardView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        style()
        constrain()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func configure() {
        contentView.addSubview(postCardView)
    }
    
    private func style() {
        
    }
    
    private func constrain() {
        NSLayoutConstraint.activate([
            postCardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            postCardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            postCardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            postCardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }
    
    public func configure(with post: Post) {
        postCardView.configure(with: post)
    }
}
