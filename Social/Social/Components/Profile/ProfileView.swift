//
// ProfileView.swift
// Social
//
// Created by Brett Markowitz on 1/13/22.
//

import UIKit

class ProfileView: UIView {
    
    public let user: User
    
    enum Section: Int, CaseIterable {
        case info
        case posts
    }
    
    private var collectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<Section, ProfileItem.ID>!
    
    public init(user: User = data.currentUser) {
        self.user = user
        
        super.init(frame: .zero)
        
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
        
        collectionView.register(ProfileInfoCollectionViewCell.self,
                                forCellWithReuseIdentifier: String(describing: ProfileInfoCollectionViewCell.self))
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
            case .info:
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
        dataSource = UICollectionViewDiffableDataSource<Section, ProfileItem.ID>(collectionView: collectionView, cellProvider: { [weak self] collectionView, indexPath, itemIdentifier in
            guard let self = self else { fatalError() }
            
            let sectionIdentifier = self.dataSource.sectionIdentifier(for: indexPath.section)
            
            switch sectionIdentifier {
            case .info:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ProfileInfoCollectionViewCell.self), for: indexPath) as! ProfileInfoCollectionViewCell
                cell.configure(with: data.currentUser)
                
                return cell
            default:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PostCollectionViewCell.self), for: indexPath) as! PostCollectionViewCell
                
                let item = data.getPostsByUserID(self.user.id).first { $0.id == itemIdentifier }
                if case .post(let post) = item {
                    cell.configure(with: post)
                }
                
                return cell
            }
        })
        
        dataSource.supplementaryViewProvider = { collectionView, kind, indexPath in
            let sectionIdentifier = self.dataSource.sectionIdentifier(for: indexPath.section)
            
            switch sectionIdentifier {
            case .info:
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter,withReuseIdentifier: String(describing: SeparatorFooterView.self), for: indexPath)
                return header
            default:
                return nil
            }
        }
    }
    
    private func updateCollectionView() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, ProfileItem.ID>()
        
        var sections: [Section] = []
        
        sections.append(.info)
        sections.append(.posts)
        
        snapshot.appendSections(sections)
        snapshot.appendItems([ProfileItem.info(defaultUser).id], toSection: .info)
        snapshot.appendItems(data.getPostsByUserID(user.id).map { $0.id }, toSection: .posts)
        
        dataSource.apply(snapshot)
    }
}
