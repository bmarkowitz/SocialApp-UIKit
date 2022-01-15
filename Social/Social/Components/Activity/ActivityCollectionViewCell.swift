//
// ActivityCollectionViewCell.swift
// Social
//
// Created by Brett Markowitz on 1/13/22.
//

import UIKit

class ActivityCollectionViewCell: UICollectionViewListCell {
    
    private let avatarView = AvatarView(height: 48, width: 48)
    private let activityLabel = UILabel()
    private let timeLabel = UILabel()
    
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
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        
        horizontalStackView.axis = .horizontal
        horizontalStackView.alignment = .center
        horizontalStackView.spacing = 8
        
        verticalStackView.axis = .vertical
        verticalStackView.alignment = .leading
        verticalStackView.spacing = 2
        
        verticalStackView.addArrangedSubview(activityLabel)
        verticalStackView.addArrangedSubview(timeLabel)
        
        horizontalStackView.addArrangedSubview(avatarView)
        horizontalStackView.addArrangedSubview(verticalStackView)
        
        contentView.addSubview(horizontalStackView)
    }
    
    private func style() {
        timeLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        timeLabel.textColor = .secondaryLabel
    }
    
    private func constrain() {
        NSLayoutConstraint.activate([
            horizontalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            horizontalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            horizontalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            horizontalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }
    
    public func configure(with activity: Activity) {
        avatarView.configure(with: activity.user)
        
        activityLabel.attributedText = NSMutableAttributedString.mixedString(with: activity.user.name, regularText: " \(activity.type == .liked ? "liked your post" : "followed you")")
        timeLabel.text = "2m"
    }
}
