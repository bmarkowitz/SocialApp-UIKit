//
// AvatarView.swift
// Social
//
// Created by Brett Markowitz on 1/9/22.
//

import UIKit
import Kingfisher

class AvatarView: UIView {
    
    private let imageView = UIImageView()
    
    private let height: CGFloat
    private let width: CGFloat

    init(height: CGFloat = 48, width: CGFloat = 48) {
        self.height = height
        self.width = width
        
        super.init(frame: .zero)
        
        configure()
        style()
        constrain()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        addSubview(imageView)
    }
    
    private func style() {
        imageView.image = UIImage(systemName: "person.crop.circle.fill")
        imageView.tintColor = .systemFill
        imageView.layer.cornerCurve = .circular
        imageView.layer.cornerRadius = height / 2
    }
    
    private func constrain() {
        // Giving these a priority silences some auto layout complaints in the console
        let trailingConstraint = imageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        trailingConstraint.priority = .init(rawValue: 999)
        
        let bottomConstraint = imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        bottomConstraint.priority = .init(rawValue: 999)
        
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: height),
            imageView.widthAnchor.constraint(equalToConstant: width),
            
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            trailingConstraint,
            bottomConstraint
        ])
    }
    
    public func configure(with user: User) {
        if let avatarUrl = user.avatarURL {
            imageView.kf.setImage(with: URL(string: avatarUrl))
        }
        else {
            imageView.image = UIImage(systemName: "person.crop.circle.fill")
        }
    }
}
