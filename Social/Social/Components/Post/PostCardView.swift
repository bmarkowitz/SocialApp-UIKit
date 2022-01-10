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
    
    private let verticalStackView = UIStackView()
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
        
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.axis = .vertical
        verticalStackView.alignment = .leading
        verticalStackView.spacing = 8
        
        contentHorizontalStackView.axis = .horizontal
        contentHorizontalStackView.alignment = .leading
        
        contentHorizontalStackView.addArrangedSubview(paddingView)
        contentHorizontalStackView.addArrangedSubview(postLabel)
        
        verticalStackView.addArrangedSubview(postHeaderView)
        verticalStackView.addArrangedSubview(contentHorizontalStackView)
        
        addSubview(verticalStackView)
    }
    
    private func style() {
        postLabel.text = "This is a test post"
    }
    
    private func constrain() {
        NSLayoutConstraint.activate([
            paddingView.widthAnchor.constraint(equalToConstant: 56),
            
            verticalStackView.topAnchor.constraint(equalTo: topAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
