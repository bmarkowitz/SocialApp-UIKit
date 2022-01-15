//
// PostDetailViewController.swift
// Social
//
// Created by Brett Markowitz on 1/15/22.
//

import UIKit

class PostDetailViewController: UIViewController {
    
    private let contentView = UIView()
    
    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Post"
        view.backgroundColor = .systemBackground
        configureNavigationBar()
    }
    
    private func configureNavigationBar() {
        let replyBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrowshape.turn.up.backward",
                                                                withConfiguration: UIImage.SymbolConfiguration(textStyle: .headline)),
                                                 primaryAction: nil)
        
        navigationItem.rightBarButtonItem = replyBarButtonItem
    }
}
