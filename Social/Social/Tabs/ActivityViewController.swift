//
// ActivityViewController.swift
// Social
//
// Created by Brett Markowitz on 1/12/22.
//

import UIKit

class ActivityViewController: UIViewController {
    
    private let contentView = ActivityView()
    
    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Activity"
    }
}
