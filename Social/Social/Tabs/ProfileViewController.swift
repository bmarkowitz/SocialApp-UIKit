//
// ProfileViewController.swift
// Social
//
// Created by Brett Markowitz on 1/13/22.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let contentView = UIView()
    
    override func loadView() {
        view = contentView
        view.backgroundColor = .systemBackground
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Profile"
    }
}
