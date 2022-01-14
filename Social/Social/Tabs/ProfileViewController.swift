//
// ProfileViewController.swift
// Social
//
// Created by Brett Markowitz on 1/13/22.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let contentView = ProfileView()
    
    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Profile"
    }
}
