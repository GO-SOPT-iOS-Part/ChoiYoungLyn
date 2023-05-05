//
//  SectionTitleCollectionReusableView.swift
//  TVING_CloneCoding
//
//  Created by 최영린 on 2023/05/01.
//

import UIKit

import SnapKit
import Then

final class SectionTitleCollectionReusableView: UICollectionReusableView, UICollectionHeaderViewRegisterable {
    
    // MARK: - Properties
    
    static var isFromNib: Bool = false
    
    // MARK: - UI Components
    
    private let sectionTitleLabel = UILabel()
    private let allButton = UIButton()
    
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

extension SectionTitleCollectionReusableView {
    private func setUI() {
        sectionTitleLabel.do {
            $0.textColor = .tvingWhite
            $0.font = .PretendardSemiBold(size: 15)
        }
        
        allButton.do {
            $0.setTitle("전체보기 >", for: .normal)
            $0.titleLabel?.font = .PretendardMedium(size: 12)
            $0.titleLabel?.textColor = .tvingGray2
            $0.setTitleColor(.tvingGray2, for: .normal)
        }
    }
    
    private func setLayout() {
        self.addSubviews(sectionTitleLabel, allButton)
        
        sectionTitleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(8)
        }
        
        allButton.snp.makeConstraints {
            $0.height.equalTo(20)
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(12)
        }
    }
    
    func setSectionTitle(text: String?) {
        self.sectionTitleLabel.text = text
    }
}

