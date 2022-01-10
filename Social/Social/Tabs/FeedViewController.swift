//
// FeedViewController.swift
// Social
//
// Created by Brett Markowitz on 1/9/22.
//

import UIKit

class FeedViewController: UIViewController {
    
    private let contentView = FeedView()
    
    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Feed"
        configureNavigationBar()
    }
    
    private func configureNavigationBar() {
        let newPostBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus.circle.fill"))
        
        navigationItem.rightBarButtonItem = newPostBarButtonItem
    }
}
