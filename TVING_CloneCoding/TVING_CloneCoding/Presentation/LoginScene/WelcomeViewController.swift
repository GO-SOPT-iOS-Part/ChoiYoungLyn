//
//  WelcomeViewController.swift
//  TVING-CloneCoding
//
//  Created by 최영린 on 2023/04/10.
//

import UIKit

final class WelcomeViewController: UIViewController {

    // MARK: - Properties
    
    private let tvingImageView = UIImageView()
    private let welcomeLabel = UILabel()
    private let backButton = UIButton()
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        setLayout()
    }
}

// MARK: - Extensions

private extension WelcomeViewController {
    
    func setUI() {
        view.backgroundColor = .tvingBlack
        
        tvingImageView.do {
            $0.image = ImageLiterals.Login.tvingImg
        }
        
        welcomeLabel.do {
            $0.textColor = .tvingGray1
            $0.font = .PretendardBold(size: 23)
            $0.textAlignment = .center
            $0.numberOfLines = 2
        }
        
        backButton.do {
            $0.setTitle(I18N.Welcome.backButtonTitle, for: .normal)
            $0.setTitleColor(.tvingWhite, for: .normal)
            $0.titleLabel?.font = .PretendardSemiBold(size: 14)
            $0.backgroundColor = .tvingRed
            $0.layer.cornerRadius = 3
            $0.addTarget(self,
                         action: #selector(backButtonTapped),
                         for: .touchUpInside)
        }
    }
    
    func setLayout() {
        view.addSubviews(tvingImageView, welcomeLabel, backButton)
        
        tvingImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(14)
            $0.leading.trailing.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.height.equalTo(211)
        }
        
        welcomeLabel.snp.makeConstraints {
            $0.top.equalTo(tvingImageView.snp.bottom).offset(67)
            $0.centerX.equalToSuperview()
        }
        
        backButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.leading.trailing.equalToSuperview().inset(22)
            $0.height.equalTo(52)
        }
    }
    
    @objc
    func backButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension WelcomeViewController{
    func dataBind(text: String) {
        welcomeLabel.text = text + I18N.Welcome.welcomeMessage
    }
}
