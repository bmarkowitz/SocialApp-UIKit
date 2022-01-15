//
// PostDetailView.swift
// Social
//
// Created by Brett Markowitz on 1/15/22.
//

import UIKit

class PostDetailView: UIView {
    
    enum Section: Int, CaseIterable {
        case post
        case replies
    }
    
    private var collectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<Section, PostDetailItem.ID>!
    
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
        collectionView = UICollectionView(frame: .zero,
                                          collectionViewLayout: createLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
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
            case .post:
                var listConfiguration = UICollectionLayoutListConfiguration(appearance: .plain)
                listConfiguration.showsSeparators = false
                
                let section = NSCollectionLayoutSection.list(using: listConfiguration, layoutEnvironment: layoutEnvironment)
                section.supplementariesFollowContentInsets = false
                
                let footerSupplementaryItem = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(1)),
                                                                                    elementKind: UICollectionView.elementKindSectionFooter,
                                                                                    alignment: .bottom)
                footerSupplementaryItem.contentInsets = .zero
                
                section.boundarySupplementaryItems = [footerSupplementaryItem]
                
                return section
            case .replies:
                var listConfiguration = UICollectionLayoutListConfiguration(appearance: .plain)
                listConfiguration.showsSeparators = false
                
                let section = NSCollectionLayoutSection.list(using: listConfiguration, layoutEnvironment: layoutEnvironment)
                return section
            }
        }
        
        return layout
    }
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, ProfileItem.ID>(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let sectionIdentifier = self.dataSource.sectionIdentifier(for: indexPath.section)
            
            switch sectionIdentifier {
            case .post:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PostCollectionViewCell.self), for: indexPath) as! PostCollectionViewCell
                
                return cell
            default:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PostCollectionViewCell.self), for: indexPath) as! PostCollectionViewCell
                
                return cell
            }
        })
        
        dataSource.supplementaryViewProvider = { collectionView, kind, indexPath in
            let sectionIdentifier = self.dataSource.sectionIdentifier(for: indexPath.section)
            
            switch sectionIdentifier {
            case .post:
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter,withReuseIdentifier: String(describing: SeparatorFooterView.self), for: indexPath)
                return header
            default:
                return nil
            }
        }
    }
    
    private func updateCollectionView() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, PostDetailItem.ID>()
        
        var sections: [Section] = []
        
        sections.append(.post)
        sections.append(.replies)
        
        snapshot.appendSections(sections)
        snapshot.appendItems([posts[0].id], toSection: .post)
        snapshot.appendItems(posts.map { $0.id }, toSection: .replies)
        
        dataSource.apply(snapshot)
    }
}
