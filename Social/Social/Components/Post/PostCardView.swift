//
// PostCardView.swift
// Social
//
// Created by Brett Markowitz on 1/9/22.
//

import UIKit

class PostCardView: UIView {
    
    private let postHeaderView = PostHeaderView()
    private let postLabel = UILabel()
    private let postImageView = UIImageView()
    
    private let verticalStackView = UIStackView()
    private let contentVerticalStackView = UIStackView()
    private let contentHorizontalStackView = UIStackView()
    
    private let paddingView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        style()
        constrain()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        postLabel.numberOfLines = 0
        postLabel.font = UIFont.preferredFont(forTextStyle: .body)
        
        postImageView.translatesAutoresizingMaskIntoConstraints = false
        
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.axis = .vertical
        verticalStackView.alignment = .fill
        verticalStackView.spacing = 8
        
        contentVerticalStackView.axis = .vertical
        contentVerticalStackView.alignment = .fill
        contentVerticalStackView.distribution = .fill
        contentVerticalStackView.spacing = 8
        
        contentHorizontalStackView.axis = .horizontal
        contentHorizontalStackView.alignment = .fill
        contentHorizontalStackView.distribution = .fill
        
        contentVerticalStackView.addArrangedSubview(postLabel)
        contentVerticalStackView.addArrangedSubview(postImageView)
        
        contentHorizontalStackView.addArrangedSubview(paddingView)
        contentHorizontalStackView.addArrangedSubview(contentVerticalStackView)
        
        verticalStackView.addArrangedSubview(postHeaderView)
        verticalStackView.addArrangedSubview(contentHorizontalStackView)
        
        addSubview(verticalStackView)
    }
    
    private func style() {
        postLabel.text = "This is a test post"
        
        postImageView.layer.cornerCurve = .continuous
        postImageView.layer.cornerRadius = 12
        postImageView.backgroundColor = .systemFill
        postImageView.contentMode = .scaleAspectFit
        postImageView.clipsToBounds = true
    }
    
    private func constrain() {
        // Giving this a priority silences some auto layout complaints in the console
        let bottomConstraint = verticalStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        bottomConstraint.priority = .init(rawValue: 999)
        
        NSLayoutConstraint.activate([
            paddingView.widthAnchor.constraint(equalToConstant: 56),
            
            verticalStackView.topAnchor.constraint(equalTo: topAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomConstraint
        ])
        
        if let image = postImageView.image {
            postImageView.widthAnchor.constraint(equalTo: postImageView.heightAnchor, multiplier: image.size.width / image.size.height).isActive = true
        } else {
            NSLayoutConstraint.activate([
                postImageView.widthAnchor.constraint(equalTo: contentVerticalStackView.widthAnchor),
                postImageView.heightAnchor.constraint(equalTo: postImageView.widthAnchor)
            ])
        }
    }
}
