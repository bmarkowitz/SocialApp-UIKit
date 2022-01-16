//
// NewPostView.swift
// Social
//
// Created by Brett Markowitz on 1/15/22.
//

import UIKit
import Kingfisher

class NewPostView: UIView {
    
    private let avatarView = AvatarView(height: 48, width: 48)
    private let textView = UITextView()
    private let placeholderLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        style()
        constrain()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func configure() {
        textView.translatesAutoresizingMaskIntoConstraints = false
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        
        textView.delegate = self
        
        textView.addSubview(placeholderLabel)
        
        avatarView.configure(with: data.currentUser)
        
        addSubview(avatarView)
        addSubview(textView)
    }
    
    private func style() {
        textView.font = UIFont.preferredFont(forTextStyle: .body)
        textView.showsVerticalScrollIndicator = false
        
        placeholderLabel.text = "What's happening?"
        placeholderLabel.textColor = .secondaryLabel
    }
    
    private func constrain() {
        NSLayoutConstraint.activate([
            avatarView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 12),
            avatarView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            textView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 18),
            textView.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: 4),
            textView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            textView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -12),
            
            placeholderLabel.topAnchor.constraint(equalTo: textView.topAnchor, constant: 8),
            placeholderLabel.leadingAnchor.constraint(equalTo: textView.leadingAnchor, constant: 6),
            placeholderLabel.trailingAnchor.constraint(equalTo: textView.trailingAnchor),
            placeholderLabel.bottomAnchor.constraint(equalTo: textView.bottomAnchor, constant: -8)
        ])
    }
}

extension NewPostView: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        placeholderLabel.isHidden = !textView.text.isEmpty
    }
}
