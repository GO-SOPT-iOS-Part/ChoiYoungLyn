//
//  PageControlCollectionReusableView.swift
//  TVING_CloneCoding
//
//  Created by 최영린 on 2023/05/02.
//

import UIKit

import SnapKit
import Then

final class PageControlCollectionReusableView: UICollectionReusableView, UICollectionFooterViewRegisterable {
    
    static var isFromNib: Bool = false
    
    // MARK: - UI Components
    
    let posterPageControl = UIPageControl()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

private extension PageControlCollectionReusableView {
    func setUI() {
        posterPageControl.do {
            $0.numberOfPages = 5
            $0.pageIndicatorTintColor = .tvingGray4
//            $0.currentPage = 0
            $0.currentPageIndicatorTintColor = .white
            $0.isUserInteractionEnabled = false
            $0.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
            $0.backgroundStyle = .minimal
            $0.allowsContinuousInteraction = false
        }
    }
    
    func setLayout() {
        self.addSubviews(posterPageControl)
        posterPageControl.snp.makeConstraints {
            $0.height.equalTo(40)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview()
        }
    }
}

