//
//  NickNameViewController.swift
//  TVING-CloneCoding
//
//  Created by 최영린 on 2023/04/11.
//

import UIKit

import SnapKit
import Then

final class NickNameViewController: UIViewController {
    
    // MARK: - Properties
    
    typealias handler = ((String) -> (Void))
    
    var completionHandler: handler?
    
    private let screenHeight = UIScreen.main.bounds.height
    var viewTranslation = CGPoint(x: 0, y: 0)
    var viewVelocity = CGPoint(x: 0, y: 0)
    
    private let bottomSheetView = UIView()
    private let nicknameLabel =  UILabel()
    private let nickNameTextField = UITextField()
    private lazy var nickNameSaveButton = UIButton()
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        addBottomCheetGesture()
    }
}

// MARK: - Extensions

private extension NickNameViewController {
    
    func setUI() {
        
        bottomSheetView.do {
            $0.backgroundColor = .tvingWhite
            $0.roundCorners(cornerRadius: 25, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
        }
        
        nicknameLabel.do {
            $0.text = I18N.NickName.nicknameMessage
            $0.textColor = .tvingBlack
            $0.font = .PretendardMedium(size: 23)
        }
        
        nickNameTextField.do {
            $0.placeholder = I18N.NickName.nicknamePlaceholder
            $0.setPlaceholderColor(.tvingWhite)
            $0.textColor = .tvingGray4
            $0.font = .PretendardSemiBold(size: 14)
            $0.backgroundColor = .tvingGray2
            $0.clearButtonMode = .whileEditing
            $0.layer.cornerRadius = 3
            $0.setLeftPadding(amount: 24)
            $0.addTarget(self,
                         action: #selector(textFieldDidChange),
                         for: .editingChanged)
        }
        
        nickNameSaveButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.setTitle(I18N.NickName.saveButtonTitle, for: .normal)
            $0.setTitleColor(.tvingWhite, for: .normal)
            $0.titleLabel?.font = .PretendardSemiBold(size: 14)
            $0.setBackgroundColor(.tvingRed, for: .normal)
            $0.layer.cornerRadius = 12
            $0.isEnabled = false
            $0.addTarget(self,
                         action: #selector(saveNickName),
                         for: .touchUpInside)
        }
    }
    
    func setLayout() {
        view.addSubviews(bottomSheetView)
        bottomSheetView.addSubviews(nicknameLabel, nickNameTextField, nickNameSaveButton)
        
        bottomSheetView.snp.makeConstraints {
            $0.top.equalTo(view.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(screenHeight / 2)
        }
        
        nicknameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(45)
            $0.leading.equalToSuperview().offset(20)
        }
        
        nickNameTextField.snp.makeConstraints {
            $0.top.equalTo(nicknameLabel.snp.bottom).offset(21)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        nickNameSaveButton.snp.makeConstraints {
            $0.bottom.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
    }
    
    @objc
    func saveNickName() {
        guard let nickName = nickNameTextField.text else { return }
        if nickName.isOnlyKorean(){
            completionHandler?(nickName)
            self.dismiss(animated: false)
        }
        else {
            makeAlert(title: I18N.NickName.inValiNicknameMessage, message: I18N.NickName.inValidNicknameSubmessage)
        }
    }
    
    @objc
    func textFieldDidChange(sender: UITextField) {
        self.nickNameSaveButton.isEnabled = !self.nickNameTextField.isEmpty
    }
    
    private func addBottomCheetGesture() {
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(moveBottomSheetWithGesture(_:))))
    }
    
    // MARK: - @objc Methods
    
    @objc func moveBottomSheetWithGesture(_ sender: UIPanGestureRecognizer) {
        
        viewTranslation = sender.translation(in: bottomSheetView)
        viewVelocity = sender.velocity(in: bottomSheetView)
        
        switch sender.state {
        case .changed:
            if viewTranslation.y < 0 {
                
            } else {
                UIView.animate(withDuration: 0.1, animations: {
                    self.view.backgroundColor = .clear
                    self.view.transform = CGAffineTransform(translationX: 0, y: self.viewTranslation.y)
                })
            }
        case .ended:
            if viewTranslation.y < 100 {
                UIView.animate(withDuration: 0.1) {
                    self.view.transform = .identity
                } completion: { _ in
                    self.view.backgroundColor = UIColor(white: 0, alpha: 0.5)
                }
            } else {
                self.view.backgroundColor = .clear
                self.dismiss(animated: false)
            }
        default:
            break
        }
    }
}

extension NickNameViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if let touch = touches.first,
           touch.view == self.view {
            view.backgroundColor = .none
            hideBottomSheetWithAnimation()
        }
    }
    
    func showBottomSheetWithAnimation() {
        UIView.animate(withDuration: 0.8) {
            self.view.backgroundColor = UIColor(white: 0, alpha: 0.5)
            self.bottomSheetView.transform = CGAffineTransform(translationX: 0, y: -self.bottomSheetView.frame.height)
        }
    }
    
    func hideBottomSheetWithAnimation() {
        UIView.animate(withDuration: 0.8) {
            self.bottomSheetView.transform = .identity
        } completion: { _ in
            self.view.backgroundColor = .clear
            self.dismiss(animated: false)
        }
    }
}
