//
//  MenuCollectionViewCell.swift
//  TVING_CloneCoding
//
//  Created by 최영린 on 2023/05/04.
//

import UIKit

final class MenuCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    static var isFromNib: Bool = false
    
    override var isSelected: Bool {
        didSet {
            menuLabel.font = isSelected ? .PretendardBold(size: 17) : .PretendardRegular(size: 17)
        }
    }
    
    // MARK: - UI Components
    
    let menuLabel = UILabel()
    
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

private extension MenuCollectionViewCell {
    func setUI() {
        menuLabel.do {
            $0.textColor = .tvingWhite
            $0.textAlignment = .center
            $0.font = .PretendardRegular(size: 17)
            $0.sizeToFit()
        }
    }
    
    func setLayout() {
        contentView.addSubviews(menuLabel)
        
        menuLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.centerY.equalToSuperview()
        }
    }
}
