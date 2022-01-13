//
// SocialTabBarController.swift
// Social
//
// Created by Brett Markowitz on 1/9/22.
//

import UIKit

class SocialTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTabBarController()
    }
    
    private func configureTabBarController() {
        viewControllers = [
            UINavigationController(rootViewController: createFeedViewController()),
            UINavigationController(rootViewController: createActivityViewController())
        ]
    }
    
    private func createFeedViewController() -> FeedViewController {
        let feedViewController = FeedViewController()
        feedViewController.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "newspaper"), tag: 0)
        
        return feedViewController
    }
    
    private func createActivityViewController() -> ActivityViewController {
        let activityViewController = ActivityViewController()
        activityViewController.tabBarItem = UITabBarItem(title: "Activity", image: UIImage(systemName: "bell.fill"), tag: 1)
        
        return activityViewController
    }
}
