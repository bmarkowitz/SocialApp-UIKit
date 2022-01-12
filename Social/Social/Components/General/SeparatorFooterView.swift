//
// SeparatorFooterView.swift
// Social
//
// Created by Brett Markowitz on 1/9/22.
//

import UIKit

class SeparatorFooterView: UICollectionReusableView {
    private let separatorView = SeparatorView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        constrain()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func constrain() {
        addSubview(separatorView)
        
        // Giving this a priority silences some auto layout complaints in the console
        let bottomConstraint = separatorView.bottomAnchor.constraint(equalTo: bottomAnchor)
        bottomConstraint.priority = .init(rawValue: 999)
        
        NSLayoutConstraint.activate([
            separatorView.topAnchor.constraint(equalTo: topAnchor),
            separatorView.leadingAnchor.constraint(equalTo: leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomConstraint
        ])
    }
}
