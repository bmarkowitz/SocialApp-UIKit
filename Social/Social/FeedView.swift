//
// FeedView.swift
// Social
//
// Created by Brett Markowitz on 1/9/22.
//

import UIKit

class FeedView: UIView {
    
    enum Section: Int, CaseIterable {
        case stories
        case posts
    }
    
    private var collectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<Section, FeedItem.ID>!
    
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
        collectionView.register(UICollectionViewListCell.self, forCellWithReuseIdentifier: "PostCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func style() {
        backgroundColor = .systemBackground
    }
    
    private func constrain() { }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            switch Section.allCases[sectionIndex] {
            case .stories:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                       heightDimension: .estimated(44))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                let spacing = CGFloat(10)
                group.interItemSpacing = .fixed(spacing)
                
                let section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = spacing
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                
                return section
            case .posts:
                var listConfiguration = UICollectionLayoutListConfiguration(appearance: .plain)
                listConfiguration.showsSeparators = false
                return NSCollectionLayoutSection.list(using: listConfiguration, layoutEnvironment: layoutEnvironment)
            }
        }
        
        return layout
    }
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, FeedItem.ID>(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let sectionIdentifier = self.dataSource.sectionIdentifier(for: indexPath.section)
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCell", for: indexPath) as! UICollectionViewListCell
            
            var config = cell.defaultContentConfiguration()
            
            switch sectionIdentifier {
            default:
                config.text = "Hello"
            }
            
            cell.contentConfiguration = config
            cell.contentView.backgroundColor = .systemRed
            
            return cell
        })
    }
    
    private func updateCollectionView() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, FeedItem.ID>()
        
        var sections: [Section] = []
        
        sections.append(.stories)
        sections.append(.posts)
        
        snapshot.appendSections(sections)
        snapshot.appendItems(stories.map { $0.id }, toSection: .stories)
        snapshot.appendItems(posts.map { $0.id }, toSection: .posts)
        
        dataSource.apply(snapshot)
    }
}
