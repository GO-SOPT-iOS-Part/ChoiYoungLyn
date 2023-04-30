//
//  MyPageHeaderView.swift
//  TVING_CloneCoding
//
//  Created by 최영린 on 2023/04/26.
//

import UIKit

import SnapKit
import Then

final class MyPageHeaderView: UITableViewHeaderFooterView, UITableViewHeaderFooterRegisterable {
    
    // MARK: - Properties
    
    static var isFromNib: Bool = false
    
    // MARK: - UI Components
    
    private let profileView = ProfileView()
    private let walletView = WalletView()
    private let joinView = JoinView()
    
    // MARK: - Life Cycles
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

extension MyPageHeaderView {
   
    private func setLayout() {
        contentView.addSubviews(profileView, walletView, joinView)
        
        profileView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(100)
        }
        
        walletView.snp.makeConstraints {
            $0.top.equalTo(profileView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(92)
        }
        
        joinView.snp.makeConstraints {
            $0.top.equalTo(walletView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(60)
        }
    }
}
