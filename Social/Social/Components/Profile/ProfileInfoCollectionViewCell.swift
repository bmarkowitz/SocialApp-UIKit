//
// ProfileInfoCollectionViewCell.swift
// Social
//
// Created by Brett Markowitz on 1/13/22.
//

import UIKit

class ProfileInfoCollectionViewCell: UICollectionViewListCell {
    
    private let avatarView = AvatarView(height: 120, width: 120)
    private let nameLabel = UILabel()
    private let usernameLabel = UILabel()
    private let followButton = UIButton()
    
    private let followersLabel = UILabel()
    private let followingLabel = UILabel()
    
    private let bioLabel = UILabel()
    
    private let websiteButton = UIButton()
    private let emailButton = UIButton()

    private let namesVerticalStackView = UIStackView()
    private let infoVerticalStackView = UIStackView()
    private let detailsVerticalStackView = UIStackView()
    private let statsHorizontalStackView = UIStackView()
    private let linkButtonHorizontalStackView = UIStackView()
    
    private let containerVerticalStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        style()
        constrain()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func configure() {
        containerVerticalStackView.translatesAutoresizingMaskIntoConstraints = false
        
        containerVerticalStackView.axis = .vertical
        containerVerticalStackView.alignment = .fill
        containerVerticalStackView.distribution = .fill
        containerVerticalStackView.spacing = 18
        
        namesVerticalStackView.axis = .vertical
        namesVerticalStackView.alignment = .center
        namesVerticalStackView.distribution = .fillProportionally
        namesVerticalStackView.spacing = 4
        
        infoVerticalStackView.axis = .vertical
        infoVerticalStackView.alignment = .center
        infoVerticalStackView.distribution = .fillProportionally
        infoVerticalStackView.spacing = 8
        
        detailsVerticalStackView.axis = .vertical
        detailsVerticalStackView.alignment = .leading
        detailsVerticalStackView.distribution = .equalSpacing
        detailsVerticalStackView.spacing = 12
        
        statsHorizontalStackView.axis = .horizontal
        statsHorizontalStackView.alignment = .center
        statsHorizontalStackView.distribution = .fillProportionally
        statsHorizontalStackView.spacing = 25
        
        linkButtonHorizontalStackView.axis = .horizontal
        linkButtonHorizontalStackView.alignment = .center
        linkButtonHorizontalStackView.distribution = .fillProportionally
        linkButtonHorizontalStackView.spacing = 25
        
        namesVerticalStackView.addArrangedSubview(nameLabel)
        namesVerticalStackView.addArrangedSubview(usernameLabel)
        
        infoVerticalStackView.addArrangedSubview(avatarView)
        infoVerticalStackView.addArrangedSubview(namesVerticalStackView)
        
        statsHorizontalStackView.addArrangedSubview(followersLabel)
        statsHorizontalStackView.addArrangedSubview(followingLabel)
        
        detailsVerticalStackView.addArrangedSubview(statsHorizontalStackView)
        detailsVerticalStackView.addArrangedSubview(bioLabel)
        detailsVerticalStackView.addArrangedSubview(linkButtonHorizontalStackView)
        
        linkButtonHorizontalStackView.addArrangedSubview(websiteButton)
        linkButtonHorizontalStackView.addArrangedSubview(emailButton)
        
        containerVerticalStackView.addArrangedSubview(infoVerticalStackView)
        containerVerticalStackView.addArrangedSubview(followButton)
        containerVerticalStackView.addArrangedSubview(detailsVerticalStackView)
        
        contentView.addSubview(containerVerticalStackView)
    }
    
    private func style() {
        nameLabel.font = UIFont.semiBoldPreferredFont(forTextStyle: .title2)
        usernameLabel.textColor = .secondaryLabel
        
        var followButtonConfiguration = UIButton.Configuration.filled()
        followButtonConfiguration.background.cornerRadius = 8
        followButtonConfiguration.title = "Follow"
        followButtonConfiguration.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var container = incoming
            container.font = UIFont.semiBoldPreferredFont(forTextStyle: .callout)
            return container
        }
        followButton.configuration = followButtonConfiguration
        
        followersLabel.attributedText = NSMutableAttributedString.mixedString(with: "100", regularText: " followers")
        followingLabel.attributedText = NSMutableAttributedString.mixedString(with: "50", regularText: " following")
        
        bioLabel.numberOfLines = 0
        
        var websiteButtonConfiguration = UIButton.Configuration.plain()
        websiteButtonConfiguration.image = UIImage(systemName: "safari.fill", withConfiguration: UIImage.SymbolConfiguration(textStyle: .callout, scale: .default))
        websiteButtonConfiguration.imagePadding = 4
        websiteButtonConfiguration.contentInsets = .zero
        websiteButtonConfiguration.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var container = incoming
            container.font = UIFont.preferredFont(forTextStyle: .callout)
            return container
        }
        websiteButton.configuration = websiteButtonConfiguration
        
        var emailButtonConfiguration = UIButton.Configuration.plain()
        emailButtonConfiguration.image = UIImage(systemName: "envelope.fill", withConfiguration: UIImage.SymbolConfiguration(textStyle: .callout, scale: .default))
        emailButtonConfiguration.imagePadding = 4
        emailButtonConfiguration.contentInsets = .zero
        emailButtonConfiguration.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var container = incoming
            container.font = UIFont.preferredFont(forTextStyle: .callout)
            return container
        }
        emailButton.configuration = emailButtonConfiguration
    }
    
    private func constrain() {
        NSLayoutConstraint.activate([
            containerVerticalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            containerVerticalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            containerVerticalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            containerVerticalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }
    
    public func configure(with user: User) {
        avatarView.configure(with: user)
        nameLabel.text = user.name
        usernameLabel.text = "@\(user.username)"
        bioLabel.text = user.bio ?? ""
        
        websiteButton.configuration?.title = user.website ?? "google.com"
        emailButton.configuration?.title = user.email
    }
}
