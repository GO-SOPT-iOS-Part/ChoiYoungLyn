//
//  ContentsCollectionViewCell.swift
//  TVING_CloneCoding
//
//  Created by 최영린 on 2023/05/01.
//

import UIKit

import SnapKit
import Kingfisher
import Then


final class ContentsCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    static var isFromNib: Bool = false
    
    // MARK: - UI Components
    
    private let posterImageView = UIImageView()
    private let titleLabel = UILabel()
    
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

extension ContentsCollectionViewCell {
    private func setUI() {
        posterImageView.do {
            $0.layer.cornerRadius = 3
        }
        
        titleLabel.do {
            $0.textColor = .tvingGray2
            $0.font = .PretendardMedium(size: 10)
        }
    }
    
    private func setLayout() {
        contentView.addSubviews(posterImageView, titleLabel)
        
        posterImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalTo(98)
            $0.height.equalTo(146)
            $0.centerX.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(posterImageView.snp.bottom).offset(3)
            $0.leading.equalTo(posterImageView.snp.leading)
            $0.width.equalTo(98)
        }
    }
    
    func configureCell(_ mustHaveData: NowPlayingResult) {
        posterImageView.kf.setImage(with: URL(string: URLConstant.imgURL + mustHaveData.posterPath))
        titleLabel.text = mustHaveData.title
    }
}
