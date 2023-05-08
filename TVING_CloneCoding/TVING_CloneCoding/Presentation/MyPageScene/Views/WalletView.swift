//
//  walletView.swift
//  TVING_CloneCoding
//
//  Created by 최영린 on 2023/04/26.
//

import UIKit

import SnapKit
import Then

final class WalletView: BaseView {

    // MARK: - UI Components
    
    private let ticketImageView = UIImageView()
    private let ticketLabel = UILabel()
    private let ticketStackView = UIStackView()
    private let cashImageView = UIImageView()
    private let cashLabel = UILabel()
    private let cashStackView = UIStackView()
    private let myTicketLabel = UILabel()
    private let myCashLabel = UILabel()
    
    // MARK: - Functions
    
    override func setUI() {
        self.backgroundColor = .tvingGray5
        self.layer.cornerRadius = 3
        
        ticketImageView.do {
            $0.image = ImageLiterals.MyPage.ticketIcon
        }
        
        ticketLabel.do {
            $0.text = I18N.MyPage.ticket
            $0.textColor = .tvingGray3
            $0.font = .PretendardMedium(size: 13)
        }
        
        cashImageView.do {
            $0.image = ImageLiterals.MyPage.cashIcon
        }
        
        cashLabel.do {
            $0.text = I18N.MyPage.cash
            $0.textColor = .tvingGray3
            $0.font = .PretendardMedium(size: 13)
        }
        
        [cashStackView, ticketStackView].forEach {
            $0.spacing = 5
            $0.axis = .horizontal
            $0.alignment = .center
        }
        
        myTicketLabel.do {
            $0.text = I18N.MyPage.noTicket
            $0.textColor = .tvingGray3
            $0.font = .PretendardMedium(size: 13)
        }
        
        myCashLabel.do {
            $0.text = I18N.MyPage.myCash
            $0.textColor = .tvingWhite
            $0.font = .PretendardBold(size: 15)
        }
    }
    
    override func setLayout() {
        self.addSubviews(ticketImageView, ticketLabel, ticketStackView, myTicketLabel,
                            cashImageView, cashLabel, cashStackView, myCashLabel)
        ticketStackView.addArrangedSubviews(ticketImageView, ticketLabel)
        cashStackView.addArrangedSubviews(cashImageView, cashLabel)
        
        ticketImageView.snp.makeConstraints {
            $0.size.equalTo(23)
        }
        
        cashImageView.snp.makeConstraints {
            $0.size.equalTo(23)
        }
        
        cashLabel.snp.makeConstraints {
            $0.height.equalTo(20)
        }
        
        ticketLabel.snp.makeConstraints {
            $0.height.equalTo(20)
        }

        ticketStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(18)
            $0.leading.equalToSuperview().inset(11)
            $0.height.equalTo(23)
        }
        
        cashStackView.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(16)
            $0.leading.equalTo(ticketStackView.snp.leading)
            $0.height.equalTo(23)
        }

        myTicketLabel.snp.makeConstraints {
            $0.height.equalTo(20)
            $0.trailing.equalToSuperview().inset(13)
            $0.centerY.equalTo(ticketStackView.snp.centerY)
        }

        myCashLabel.snp.makeConstraints {
            $0.height.equalTo(23)
            $0.trailing.equalToSuperview().inset(13)
            $0.centerY.equalTo(cashStackView.snp.centerY)
        }
    }
}
