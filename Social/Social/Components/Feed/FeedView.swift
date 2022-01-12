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
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.register(UICollectionViewListCell.self,
                                forCellWithReuseIdentifier: String(describing: UICollectionViewListCell.self))
        collectionView.register(StoryCollectionViewCell.self,
                                forCellWithReuseIdentifier: String(describing: StoryCollectionViewCell.self))
        collectionView.register(PostCollectionViewCell.self,
                                forCellWithReuseIdentifier: String(describing: PostCollectionViewCell.self))
        collectionView.register(SeparatorFooterView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                                withReuseIdentifier: String(describing: SeparatorFooterView.self))
        
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
            switch Section.allCases[sectionIndex] {
            case .stories:
                let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(44),
                                                      heightDimension: .estimated(44))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(44),
                                                       heightDimension: .estimated(44))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 20, bottom: 20, trailing: 0)
                section.supplementariesFollowContentInsets = false
                
                let footerSupplementaryItem = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(1)),
                                                                                    elementKind: UICollectionView.elementKindSectionFooter,
                                                                                    alignment: .bottom)
                footerSupplementaryItem.contentInsets = .zero
                
                section.boundarySupplementaryItems = [footerSupplementaryItem]
                
                return section
            case .posts:
                var listConfiguration = UICollectionLayoutListConfiguration(appearance: .plain)
                listConfiguration.showsSeparators = false
                
                let section = NSCollectionLayoutSection.list(using: listConfiguration, layoutEnvironment: layoutEnvironment)
                return section
            }
        }
        
        return layout
    }
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, FeedItem.ID>(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let sectionIdentifier = self.dataSource.sectionIdentifier(for: indexPath.section)
            
            switch sectionIdentifier {
            case .stories:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier:String(describing: StoryCollectionViewCell.self), for: indexPath) as! StoryCollectionViewCell
                
                return cell
            default:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PostCollectionViewCell.self), for: indexPath) as! PostCollectionViewCell
                
                return cell
            }
        })
        
        dataSource.supplementaryViewProvider = { collectionView, kind, indexPath in
            let sectionIdentifier = self.dataSource.sectionIdentifier(for: indexPath.section)
            
            switch sectionIdentifier {
            case .stories:
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: String(describing: SeparatorFooterView.self), for: indexPath)
                return header
            default:
                return nil
            }
        }
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
