//
//  JoinView.swift
//  TVING_CloneCoding
//
//  Created by 최영린 on 2023/04/26.
//

import UIKit

import SnapKit
import Then

final class JoinView: BaseView {

    // MARK: - UI Components
    
    private let joinLabel = UILabel()
    private let logoImg = NSTextAttachment()
    private lazy var detailButton = UIButton()
    
    // MARK: - Function
    
    override func setUI() {
        self.backgroundColor = .tvingGray5
        self.layer.cornerRadius = 3
       
        logoImg.do {
            $0.image = ImageLiterals.MyPage.tvnjtbcImg.resize(newWidth: 50)
        }

        joinLabel.do{
            $0.textColor = .tvingGray2
            $0.font = .PretendardSemiBold(size: 12)
            $0.numberOfLines = 2
            let joinString1 = NSAttributedString(string: I18N.MyPage.join1)
            let image = NSAttributedString(attachment: logoImg)
            let joinString2  = NSAttributedString(string: I18N.MyPage.join2)
            $0.labelWithImg(composition: joinString1, image, joinString2, spacing: 5)
        }
        
        detailButton.do {
            $0.setImage(ImageLiterals.MyPage.detailBtn, for: .normal)
        }
    }
    
    override func setLayout() {
        self.addSubviews(joinLabel, detailButton)
        
        joinLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(18)
            $0.centerY.equalToSuperview()
        }
        
        detailButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-18)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(18)
        }
    }
}
