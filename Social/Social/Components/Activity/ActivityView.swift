//
// ActivityView.swift
// Social
//
// Created by Brett Markowitz on 1/12/22.
//

import UIKit

class ActivityView: UIView {
    
    enum Section: Int {
        case feed
    }
    
    private var collectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<Section, Activity.ID>!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        style()
        constrain()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func configure() {

    }
    
    private func style() {
        backgroundColor = .systemBackground
    }
    
    private func constrain() {
        
    }
}
