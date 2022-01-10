//
// AvatarView.swift
// Social
//
// Created by Brett Markowitz on 1/9/22.
//

import UIKit

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
        imageView.image = UIImage(systemName: "person.crop.circle.fill")
        imageView.contentMode = .scaleAspectFill
        
        addSubview(imageView)
    }
    
    private func style() {
        imageView.layer.cornerCurve = .circular
        imageView.layer.cornerRadius = height / 2
    }
    
    private func constrain() {
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(greaterThanOrEqualToConstant: height),
            imageView.widthAnchor.constraint(greaterThanOrEqualToConstant: width),
            
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
