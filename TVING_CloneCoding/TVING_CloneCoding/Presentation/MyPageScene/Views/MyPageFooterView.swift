//
//  MyPageFooterView.swift
//  TVING_CloneCoding
//
//  Created by 최영린 on 2023/04/26.
//

import UIKit

import SnapKit
import Then

final class MyPageFooterView: UITableViewHeaderFooterView, UITableViewHeaderFooterRegisterable {

    // MARK: - Properties
    
    static var isFromNib = false
    
    // MARK: - UI Components
    
    private lazy var logoutButton = UIButton()
    
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

extension MyPageFooterView {
    private func setUI() {
        logoutButton.do {
            $0.setTitle(I18N.MyPage.logoutButtonTitle, for: .normal)
            $0.titleLabel?.font = .PretendardSemiBold(size: 14)
            $0.setTitleColor(.tvingGray2, for: .normal)
            $0.setBackgroundColor(.clear, for: .normal)
            $0.makeRoundBorder(cornerRadius: 3, borderWidth: 1, borderColor: .tvingGray4)
        }
    }
    
    private func setLayout() {
        contentView.addSubviews(logoutButton)
        
        logoutButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(23)
            $0.leading.trailing.equalToSuperview().inset(8)
            $0.height.equalTo(55)
        }
    }
}
