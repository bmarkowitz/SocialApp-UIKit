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
        configureNavigationBar()
    }
    
    private func configureNavigationBar() {
        let shareBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up",
                                                                withConfiguration: UIImage.SymbolConfiguration(weight: .semibold)))
        
        navigationItem.rightBarButtonItem = shareBarButtonItem
    }
}
