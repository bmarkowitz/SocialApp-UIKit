//
// PostCardView.swift
// Social
//
// Created by Brett Markowitz on 1/9/22.
//

import UIKit
import Kingfisher

class PostCardView: UIView {
    
    private let postHeaderView = PostHeaderView()
    private let postLabel = UILabel()
    private let postImageView = UIImageView()
    private let postReactionsBarView = PostReactionsBarView()
    
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
        verticalStackView.spacing = 8
        
        contentVerticalStackView.axis = .vertical
        contentVerticalStackView.spacing = 16
        
        contentHorizontalStackView.axis = .horizontal
        
        contentVerticalStackView.addArrangedSubview(postLabel)
        contentVerticalStackView.addArrangedSubview(postImageView)
        contentVerticalStackView.addArrangedSubview(postReactionsBarView)
        
        contentHorizontalStackView.addArrangedSubview(paddingView)
        contentHorizontalStackView.addArrangedSubview(contentVerticalStackView)
        
        verticalStackView.addArrangedSubview(postHeaderView)
        verticalStackView.addArrangedSubview(contentHorizontalStackView)
        
        addSubview(verticalStackView)
    }
    
    private func style() {
        postLabel.text = "Here's to the crazy ones"
        
        postImageView.layer.cornerCurve = .continuous
        postImageView.layer.cornerRadius = 12
        postImageView.backgroundColor = .systemFill
        postImageView.contentMode = .scaleAspectFill
        postImageView.clipsToBounds = true
        postImageView.isHidden = true
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
            bottomConstraint,
            
            postImageView.widthAnchor.constraint(equalTo: contentVerticalStackView.widthAnchor),
            postImageView.heightAnchor.constraint(equalTo: postImageView.widthAnchor, multiplier: 0.75)
        ])
    }
    
    public func configure(with post: Post) {
        postHeaderView.configure(with: post)
        postLabel.text = post.content
        postReactionsBarView.configure(with: post)
        
        if let postImageUrl = post.imageURL {
            postImageView.isHidden = false
            postImageView.kf.setImage(with: URL(string: postImageUrl))
        }
        else {
            postImageView.isHidden = true
        }
    }
}
