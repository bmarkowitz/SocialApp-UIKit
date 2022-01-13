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
        
        configureDataSource()
        updateCollectionView()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func configure() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.register(UICollectionViewListCell.self,
                                forCellWithReuseIdentifier: String(describing: UICollectionViewListCell.self))
        
        addSubview(collectionView)
    }
    
    private func style() {
        backgroundColor = .systemBackground
    }
    
    private func constrain() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            var listConfiguration = UICollectionLayoutListConfiguration(appearance: .plain)
            listConfiguration.showsSeparators = false
            
            let section = NSCollectionLayoutSection.list(using: listConfiguration, layoutEnvironment: layoutEnvironment)
            return section
            
        }
        
        return layout
    }
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, FeedItem.ID>(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
           
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: UICollectionViewListCell.self), for: indexPath) as! UICollectionViewListCell
            
            var config = cell.defaultContentConfiguration()
            config.text = "Testing"
            
            cell.contentConfiguration = config
            
            return cell
        })
    }
    
    private func updateCollectionView() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, FeedItem.ID>()
        
        var sections: [Section] = []
        
        sections.append(.feed)
        
        snapshot.appendSections(sections)
        snapshot.appendItems(activities.map { $0.id }, toSection: .feed)
        
        dataSource.apply(snapshot)
    }
}
