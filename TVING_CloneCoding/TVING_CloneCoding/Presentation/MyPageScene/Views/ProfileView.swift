//
//  ProfileView.swift
//  TVING_CloneCoding
//
//  Created by 최영린 on 2023/04/26.
//

import UIKit

import SnapKit
import Then

final class ProfileView: BaseView {
    
    // MARK: - UI Components
    
    private let profileImageView = UIImageView()
    private let nickNameLabel =  UILabel()
    private let profileChangeButton = UIButton()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    override func setUI() {
        profileImageView.do {
            $0.image = ImageLiterals.MyPage.profileImg
            $0.layer.cornerRadius = 10
        }
        
        nickNameLabel.do {
            $0.text = I18N.MyPage.nickName
            $0.textColor = .tvingWhite
            $0.font = .PretendardMedium(size: 17)
        }
        
        profileChangeButton.do {
            $0.setTitle(I18N.MyPage.profileChangeButtonTitle, for: .normal)
            $0.titleLabel?.font = .PretendardSemiBold(size: 10)
            $0.setTitleColor(.tvingGray2, for: .normal)
            $0.setBackgroundColor(.clear, for: .normal)
            $0.makeRoundBorder(cornerRadius: 3, borderWidth: 1, borderColor: .tvingGray4)
        }
    }
    
    override func setLayout() {
        self.addSubviews(profileImageView, nickNameLabel, profileChangeButton)
        
        profileImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(24)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(72)
        }
        
        nickNameLabel.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.trailing).offset(22)
            $0.centerY.equalToSuperview()
        }
        
        profileChangeButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(23)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(70)
            $0.height.equalTo(25)
        }
    }
}
