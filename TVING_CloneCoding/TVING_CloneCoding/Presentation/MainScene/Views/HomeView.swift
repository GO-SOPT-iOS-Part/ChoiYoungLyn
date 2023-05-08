//
//  HomeView.swift
//  TVING_CloneCoding
//
//  Created by 최영린 on 2023/05/01.
//

import UIKit

import SnapKit
import Then

final class HomeView: BaseView {
    
    private typealias SectionType = AboutSection
    
    @frozen
    private enum AboutSection: CaseIterable {
        case poster, mustHave, live, series
    }
    
    // MARK: - UI Components
    
    private let posterDummy = PosterDataModel.dummy()
    private let musthaveDummy = SeriesDataModel.dummy()
    private let liveDummy = LiveDataModel.dummy()
    private let seriesDummy = SeriesDataModel.dummy()
    
    private lazy var homeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: self.getLayout())
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        registerCell()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setUI() {
        homeCollectionView.do {
            $0.contentInsetAdjustmentBehavior = .never
            $0.collectionViewLayout = self.getLayout()
            $0.backgroundColor = .tvingBlack
            $0.showsVerticalScrollIndicator = false
            $0.dataSource = self
        }
    }
    
    override func setLayout() {
        self.addSubviews(homeCollectionView)
        
        homeCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

// MARK: - Extensions

extension HomeView {
    func registerCell() {
        PosterCollectionViewCell.register(target: homeCollectionView)
        PageControlCollectionReusableView.register(target: homeCollectionView)
        SectionTitleCollectionReusableView.register(target: homeCollectionView)
        SeriesCollectionViewCell.register(target: homeCollectionView)
        LiveCollectionViewCell.register(target: homeCollectionView)
    }
    
    func getLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, env -> NSCollectionLayoutSection? in
            let sectionType = SectionType.allCases[sectionIndex]
            switch sectionType {
            case .poster:
                return self.getLayoutPosterSection()
            case .mustHave:
                return self.getLayoutMustHaveSection()
            case .live:
                return self.getLayoutLiveSection()
            case .series:
                return self.getLayoutSeriesSection()
            }
        }
    }
    
    func getLayoutPosterSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(520)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let footerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(40)
        )
        let footer = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: footerSize,
            elementKind: UICollectionView.elementKindSectionFooter,
            alignment: .bottom
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.visibleItemsInvalidationHandler = { items, contentOffset, environment in
            let currentPage = Int(max(0, round(contentOffset.x / environment.container.contentSize.width)))
            PageControlCollectionReusableView().posterPageControl.currentPage = currentPage
        }
        section.boundarySupplementaryItems = [footer]
        return section
    }
    
    func getLayoutMustHaveSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.6),
            heightDimension: .absolute(170)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(40)
        )
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = [header]
        return section
    }
    
    func getLayoutLiveSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 8, bottom: 2, trailing: 8)
    
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.9),
            heightDimension: .absolute(140)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(40)
        )
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = [header]
        return section
    }
    
    func getLayoutSeriesSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.6),
            heightDimension: .absolute(170)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(40)
        )
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = [header]
        return section
    }
}

extension HomeView: UICollectionViewDelegate {
    
}

extension HomeView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return AboutSection.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionType = SectionType.allCases[section]
        switch sectionType {
        case .poster:
            return posterDummy.count
        case .mustHave:
            return musthaveDummy.count
        case .live:
            return liveDummy.count
        case .series:
            return seriesDummy.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionType = SectionType.allCases[indexPath.section]
        switch sectionType {
        case .poster:
            let cell = PosterCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
            cell.configureCell(posterDummy[indexPath.item])
            return cell
        case .mustHave, .series:
            let cell = SeriesCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
            cell.configureCell(seriesDummy[indexPath.item])
            return cell
        case .live:
            let cell =  LiveCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
            cell.configureCell(liveDummy[indexPath.item])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionType = SectionType.allCases[indexPath.section]
        switch sectionType {
        case .poster:
            let footerView = PageControlCollectionReusableView.dequeueReusableFooterView(collectionView: collectionView, indexPath: indexPath)
            return footerView
        case .mustHave:
            let headerView = SectionTitleCollectionReusableView.dequeueReusableHeaderView(collectionView: collectionView, indexPath: indexPath)
            headerView.setSectionTitle(text: "티빙에서 꼭 봐야하는 콘텐츠")
            return headerView
        case .live:
            let headerView = SectionTitleCollectionReusableView.dequeueReusableHeaderView(collectionView: collectionView, indexPath: indexPath)
            headerView.setSectionTitle(text: "인기 LIVE 채널")
            return headerView
        case .series:
            let headerView = SectionTitleCollectionReusableView.dequeueReusableHeaderView(collectionView: collectionView, indexPath: indexPath)
            headerView.setSectionTitle(text: "1화 무료! 파라마운트+ 인기시리즈")
            return headerView
        }
    }
}

