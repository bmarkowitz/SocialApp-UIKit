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
        contentView.delegate = self
        
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Feed"
        configureNavigationBar()
    }
    
    private func configureNavigationBar() {
        let newPostAction = UIAction { _ in
            self.navigationController?.present(UINavigationController(rootViewController: NewPostViewController()),
                                               animated: true,
                                               completion: nil)
        }
        
        let newPostBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus.circle.fill"),
                                                   primaryAction: newPostAction)
        
        navigationItem.rightBarButtonItem = newPostBarButtonItem
    }
}

extension FeedViewController: FeedViewDelegate {
    func didTapPost() {
        navigationController?.pushViewController(PostDetailViewController(), animated: true)
    }
}
