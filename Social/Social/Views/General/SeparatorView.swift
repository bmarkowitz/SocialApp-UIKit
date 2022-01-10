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
        configureView()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func configureView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .separator
        
        heightAnchor.constraint(equalToConstant: 1.0 / UIScreen.main.scale).isActive = true
    }
}
