//
//  TvingNavigationViewView.swift
//  TVING_CloneCoding
//
//  Created by 최영린 on 2023/05/04.
//

import UIKit

import SnapKit
import Then

final class TvingNavigationView: BaseView {
    
    // MARK: - UI Components
    
    lazy var tvingButton = UIButton()
    lazy var myPageButton = UIButton()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setUI() {
        self.backgroundColor = .clear
        
        tvingButton.do {
            $0.setImage(ImageLiterals.Main.tvingIcon, for: .normal)
        }
        
        myPageButton.do {
            $0.setImage(ImageLiterals.MyPage.profileImg, for: .normal)
            $0.layer.cornerRadius = 15
            $0.layer.masksToBounds = true
        }
    }
    
    override func setLayout() {
        self.addSubviews(tvingButton, myPageButton)
        
        tvingButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(11)
            $0.height.equalTo(25)
            $0.centerY.equalToSuperview()
        }
        
        myPageButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(8)
            $0.size.equalTo(30)
            $0.centerY.equalToSuperview()
        }
    }
}
