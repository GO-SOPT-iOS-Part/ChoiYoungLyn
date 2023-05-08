//
//  MyPageTableViewCell.swift
//  TVING_CloneCoding
//
//  Created by 최영린 on 2023/04/26.
//

import UIKit

import SnapKit
import Then

final class MyPageTableViewCell: UITableViewCell, UITableViewRegisterable {

    // MARK: - Properties
    
    static var isFromNib = false
    
    // MARK: - UI Components
    
    let cellLabel = UILabel()
    private lazy var detailButton = UIButton()
    
    // MARK: - Life Cycles

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

private extension MyPageTableViewCell {
    
    func setUI() {
        contentView.backgroundColor = .tvingBlack
        
        cellLabel.do {
            $0.font = .PretendardMedium(size: 15)
            $0.textColor = .tvingGray2
        }
        
        detailButton.do {
            $0.setImage(ImageLiterals.MyPage.detailBtn, for: .normal)
        }
    }
    
    func setLayout() {
        contentView.addSubviews(cellLabel, detailButton)
    
        cellLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(18)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(21)
        }
        
        detailButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-18)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(18)
        }
    }
}
