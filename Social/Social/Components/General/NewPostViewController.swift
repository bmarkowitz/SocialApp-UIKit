//
// NewPostViewController.swift
// Social
//
// Created by Brett Markowitz on 1/13/22.
//

import UIKit

class NewPostViewController: UIViewController {
    
    private let contentView = NewPostView()
    
    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "New"
        view.backgroundColor = .systemBackground
    }
}
