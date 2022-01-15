//
// NewPostViewController.swift
// Social
//
// Created by Brett Markowitz on 1/13/22.
//

import UIKit

class NewPostViewController: UIViewController {
    
    private let contentView = NewPostView()
    
    public var isReplying = false
    
    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "New"
        view.backgroundColor = .systemBackground
        configureNavigationBar()
    }
    
    private func configureNavigationBar() {
        let cancelBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonTapped))
        let postBarButtonItem = UIBarButtonItem(title: isReplying ? "Reply" : "Post", style: .done, target: self, action: #selector(cancelButtonTapped))
        
        navigationItem.leftBarButtonItem = cancelBarButtonItem
        navigationItem.rightBarButtonItem = postBarButtonItem
    }
    
    @objc func cancelButtonTapped() {
        self.dismiss(animated: true)
    }
}
