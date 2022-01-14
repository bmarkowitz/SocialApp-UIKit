//
// PostReactionsBarView.swift
// Social
//
// Created by Brett Markowitz on 1/11/22.
//

import UIKit

class PostReactionsBarView: UIView {
    
    private let replyButton = UIButton()
    private let likeButton = UIButton()
    private let shareButton = UIButton()
    
    private let reactionsStackView = UIStackView()
    private let actionsStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        style()
        constrain()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        actionsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        reactionsStackView.axis = .horizontal
        reactionsStackView.distribution = .fillEqually
        reactionsStackView.spacing = 24
        
        actionsStackView.axis = .horizontal
        actionsStackView.distribution = .equalSpacing
        
        reactionsStackView.addArrangedSubview(replyButton)
        reactionsStackView.addArrangedSubview(likeButton)
        
        actionsStackView.addArrangedSubview(reactionsStackView)
        actionsStackView.addArrangedSubview(shareButton)
        
        addSubview(actionsStackView)
    }
    
    private func style() {
        var replyButtonConfiguration = UIButton.Configuration.plain()
        replyButtonConfiguration.title = "2"
        replyButtonConfiguration.image = UIImage(systemName: "bubble.right", withConfiguration: UIImage.SymbolConfiguration(textStyle: .caption1))
        replyButtonConfiguration.contentInsets = .zero
        replyButtonConfiguration.imagePadding = 4
        replyButtonConfiguration.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var container = incoming
            container.foregroundColor = .secondaryLabel
            return container
        }
        
        replyButtonConfiguration.imageColorTransformer = UIConfigurationColorTransformer { _ in
            return .secondaryLabel
        }
        replyButton.configuration = replyButtonConfiguration
        
        var likeButtonConfiguration = UIButton.Configuration.plain()
        likeButtonConfiguration.title = "7"
        likeButtonConfiguration.image = UIImage(systemName: "heart", withConfiguration: UIImage.SymbolConfiguration(textStyle: .caption1))
        likeButtonConfiguration.contentInsets = .zero
        likeButtonConfiguration.imagePadding = 4
        likeButtonConfiguration.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var container = incoming
            container.foregroundColor = .secondaryLabel
            return container
        }
        likeButtonConfiguration.imageColorTransformer = UIConfigurationColorTransformer { _ in
            return .secondaryLabel
        }
        likeButton.configuration = likeButtonConfiguration
        
        var shareButtonConfiguration = UIButton.Configuration.plain()
        shareButtonConfiguration.image = UIImage(systemName: "square.and.arrow.up", withConfiguration: UIImage.SymbolConfiguration(textStyle: .caption1))
        shareButtonConfiguration.contentInsets = .zero
        shareButtonConfiguration.imageColorTransformer = UIConfigurationColorTransformer { _ in
            return .secondaryLabel
        }
        shareButton.configuration = shareButtonConfiguration
    }
    
    private func constrain() {
        NSLayoutConstraint.activate([
            actionsStackView.topAnchor.constraint(equalTo: topAnchor),
            actionsStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            actionsStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            actionsStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
