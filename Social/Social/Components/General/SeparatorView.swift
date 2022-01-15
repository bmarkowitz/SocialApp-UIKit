//
// SeparatorView.swift
// Social
//
// Created by Brett Markowitz on 1/9/22.
//

import UIKit

class SeparatorView: UIView {

    init() {
        super.init(frame: .zero)
        
        configure()
        style()
        constrain()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func style() {
        backgroundColor = .separator
    }
    
    private func constrain() {
        heightAnchor.constraint(equalToConstant: 1.0 / UIScreen.main.scale).isActive = true
    }
}
