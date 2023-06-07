//
//  LiveCollectionViewCell.swift
//  TVING_CloneCoding
//
//  Created by 최영린 on 2023/05/01.
//

import UIKit

import SnapKit
import Kingfisher
import Then



final class LiveCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    static var isFromNib: Bool = false
    
    // MARK: - UI Components
    
    private let liveImageView = UIImageView()
    private let rankLabel = UILabel()
    private let channelLabel = UILabel()
    private let titleLabel = UILabel()
    private let ratingLabel = UILabel()
    
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

extension LiveCollectionViewCell {
    private func setUI() {
        liveImageView.do {
            $0.layer.cornerRadius = 3
        }
        
        rankLabel.do {
            $0.textColor = .tvingWhite
            $0.font = .PretendardBold(size: 19)
        }
        
        channelLabel.do {
            $0.textColor = .tvingWhite
            $0.font = .PretendardRegular(size: 10)
        }
        
        titleLabel.do {
            $0.textColor = .tvingGray2
            $0.font = .PretendardRegular(size: 10)
        }
        
        ratingLabel.do {
            $0.textColor = .tvingGray2
            $0.font = .PretendardRegular(size: 10)
        }
    }
    
    private func setLayout() {
        contentView.addSubviews(liveImageView, rankLabel, channelLabel, titleLabel, ratingLabel)
        
        liveImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.height.equalTo(80)
            $0.width.equalTo(160)
            $0.centerX.equalToSuperview()
        }
        
        rankLabel.snp.makeConstraints {
            $0.top.equalTo(liveImageView.snp.bottom).offset(8)
            $0.leading.equalToSuperview().inset(6)
        }
        
        channelLabel.snp.makeConstraints {
            $0.top.equalTo(liveImageView.snp.bottom).offset(11)
            $0.leading.equalTo(rankLabel.snp.trailing).offset(5)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(channelLabel.snp.bottom).offset(2)
            $0.leading.equalTo(channelLabel.snp.leading)
        }
        
        ratingLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(2)
            $0.leading.equalTo(channelLabel.snp.leading)
        }
    }
    
    func configureCell(_ livaData: PopularResult) {
        liveImageView.kf.setImage(with: URL(string: URLConstant.imgURL + livaData.posterPath))
        channelLabel.text = "TVN"
        titleLabel.text = livaData.originalName
        ratingLabel.text = "\(livaData.voteAverage)%"
    }
    
    func setRankLabel(text: Int) {
        self.rankLabel.text = "\(text + 1)"
    }
}
