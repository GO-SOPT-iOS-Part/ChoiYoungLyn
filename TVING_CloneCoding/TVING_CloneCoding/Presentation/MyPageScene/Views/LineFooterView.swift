//
//  LineFooterView.swift
//  TVING_CloneCoding
//
//  Created by 최영린 on 2023/04/30.
//

import UIKit

import SnapKit
import Then

final class LineFooterView: UITableViewHeaderFooterView, UITableViewHeaderFooterRegisterable {
    
    // MARK: - Properties
    
    static var isFromNib = false
    
    // MARK: - UI Components
    
    private let lineView = UIView()
    
    // MARK: - Life Cycles
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

private extension LineFooterView {
    
    func setUI() {
        lineView.do {
            $0.backgroundColor = .tvingGray4
        }
    }
    
    func setLayout() {
        contentView.addSubviews(lineView)
        
        lineView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(8)
            $0.height.equalTo(1)
        }
    }
}
