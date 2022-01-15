//
// AddStoryView.swift
// Social
//
// Created by Brett Markowitz on 1/15/22.
//

import UIKit

class AddStoryView: UIView {
    
    private let imageView = UIImageView()
    
    init() {
        super.init(frame: .zero)
        
        configure()
        style()
        constrain()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.image = UIImage(systemName: "plus.circle.fill")
        imageView.contentMode = .scaleAspectFill
        
        addSubview(imageView)
    }
    
    private func style() {
        backgroundColor = .systemBackground
        layer.borderWidth = 2.5
        layer.borderColor = UIColor.systemBackground.cgColor
        layer.cornerRadius = 12.5
        layer.cornerCurve = .circular
    }
    
    private func constrain() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 25),
            widthAnchor.constraint(equalToConstant: 25),

            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
