//
//  LoginViewController.swift
//  TVING-CloneCoding
//
//  Created by 최영린 on 2023/04/10.
//

import UIKit

import SnapKit
import Then

final class LoginViewController: UIViewController {
    
    // MARK: - Properties
    var username: String = ""
    
    private lazy var beforeButton = UIButton()
    private let loginLabel = UILabel()
    private let idTextField =  UITextField()
    private let pwTextField = UITextField()
    private lazy var idClearButton = UIButton()
    private lazy var pwClearButton = UIButton()
    private lazy var securityButton = UIButton()
    private lazy var loginButton = UIButton()
    private lazy var findIdButton = UIButton()
    private let lineView = UIView()
    private lazy var findPwButton = UIButton()
    private let createNicknameLabel = UILabel()
    private lazy var createNicknameButton = UIButton()
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        setDelegate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        clearTextField()
    }
    
}

// MARK: - Extensions

private extension LoginViewController {
    
    func setUI() {
        view.backgroundColor = .tvingBlack
        
        beforeButton.do {
            $0.setImage(ImageLiterals.Login.beforeBtn, for: .normal)
        }
        
        loginLabel.do {
            $0.text = I18N.Login.tvingLogin
            $0.textColor = .tvingWhite
            $0.font = .PretendardBold(size: 23)
            $0.textAlignment = .center
        }
        
        idTextField.do {
            $0.placeholder = I18N.Login.id
            $0.setPlaceholderColor(.tvingGray2)
            $0.textColor = .tvingGray2
            $0.font = .PretendardSemiBold(size: 15)
            $0.backgroundColor = .tvingGray4
            $0.layer.cornerRadius = 3
            $0.setLeftPadding(amount: 22)
            $0.setRightPadding(amount: 90)
            $0.textContentType = .emailAddress
            $0.autocapitalizationType = .none
        }
        
        idClearButton.do {
            $0.setImage(ImageLiterals.Login.clearIcon, for: .normal)
            $0.isHidden = true
            $0.addTarget(self,
                         action: #selector(idClearButtonTapped),
                         for: .touchUpInside)
        }
        
        pwTextField.do {
            $0.placeholder = I18N.Login.password
            $0.setPlaceholderColor(.tvingGray2)
            $0.textColor = .tvingGray2
            $0.font = .PretendardSemiBold(size: 15)
            $0.backgroundColor = .tvingGray4
            $0.layer.cornerRadius = 3
            $0.setLeftPadding(amount: 22)
            $0.setRightPadding(amount: 90)
            $0.textContentType = .password
            $0.isSecureTextEntry = true
        }
        
        pwClearButton.do {
            $0.setImage(ImageLiterals.Login.clearIcon, for: .normal)
            $0.isHidden = true
            $0.addTarget(self,
                         action: #selector(pwClearButtonTapped),
                         for: .touchUpInside)
        }
        
        securityButton.do {
            $0.setImage(ImageLiterals.Login.securityIcon, for: .normal)
            $0.isHidden = true
            $0.addTarget(self,
                         action: #selector(securityButtonTapped),
                         for: .touchUpInside)
        }
        
        loginButton.do {
            $0.setTitle(I18N.Login.loginButtonTitle, for: .normal)
            $0.titleLabel?.font = .PretendardSemiBold(size: 14)
            $0.setTitleColor(.tvingGray2, for: .disabled)
            $0.setBackgroundColor(.clear, for: .disabled)
            $0.setTitleColor(.tvingWhite, for: .normal)
            $0.setBackgroundColor(.tvingRed, for: .normal)
            $0.makeRoundBorder(cornerRadius: 3, borderWidth: 1, borderColor: .tvingGray4)
            $0.isEnabled = false
            $0.addTarget(self,
                         action: #selector(presentLoginButtonTapped),
                         for: .touchUpInside)
        }
        
        findIdButton.do {
            $0.setTitle(I18N.Login.findIdButtonTitle, for: .normal)
            $0.setTitleColor(.tvingGray2, for: .normal)
            $0.titleLabel?.font = .PretendardSemiBold(size: 14)
            $0.backgroundColor = .clear
        }
        
        lineView.do {
            $0.backgroundColor = .tvingGray4
        }
        
        findPwButton.do {
            $0.setTitle(I18N.Login.findPwButtonTitle, for: .normal)
            $0.setTitleColor(.tvingGray2, for: .normal)
            $0.titleLabel?.font = .PretendardSemiBold(size: 14)
            $0.backgroundColor = .clear
        }
        
        createNicknameLabel.do {
            $0.text = I18N.Login.createNicknameMessage
            $0.textColor = .tvingGray3
            $0.font = .PretendardMedium(size: 14)
            $0.textAlignment = .center
        }
        
        createNicknameButton.do {
            $0.setTitle(I18N.Login.createNicknameButtonTitle, for: .normal)
            $0.setTitleColor(.tvingGray2, for: .normal)
            $0.titleLabel?.font = .PretendardRegular(size: 14)
            $0.setUnderline()
            $0.addTarget(self,
                         action: #selector(presentNickNameButtonTapped),
                         for: .touchUpInside)
        }
    }
    
    func setLayout() {
        view.addSubviews(beforeButton, loginLabel, idTextField, pwTextField,
                         loginButton, lineView, findIdButton, findPwButton,
                         createNicknameLabel, createNicknameButton)
        idTextField.addSubviews(idClearButton)
        pwTextField.addSubviews(pwClearButton, securityButton)
        
        beforeButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(25)
            $0.leading.equalToSuperview().offset(19)
            $0.width.equalTo(8)
            $0.height.equalTo(15)
        }
        
        loginLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(46)
            $0.centerX.equalToSuperview()
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(loginLabel.snp.bottom).offset(31)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        idClearButton.snp.makeConstraints {
            $0.trailing.equalTo(idTextField.snp.trailing).offset(-20)
            $0.centerY.equalTo(idTextField.snp.centerY)
            $0.width.height.equalTo(20)
        }
        
        pwTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(7)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        pwClearButton.snp.makeConstraints {
            $0.trailing.equalTo(securityButton.snp.leading).offset(-16)
            $0.centerY.equalTo(pwTextField.snp.centerY)
            $0.width.height.equalTo(20)
        }
        
        securityButton.snp.makeConstraints {
            $0.trailing.equalTo(pwTextField.snp.trailing).inset(20)
            $0.centerY.equalTo(pwTextField.snp.centerY)
            $0.width.height.equalTo(20)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(pwTextField.snp.bottom).offset(21)
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        lineView.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(36)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(12)
            $0.width.equalTo(1)
        }
        
        findIdButton.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(31)
            $0.trailing.equalTo(lineView.snp.leading).offset(-33)
            $0.height.equalTo(22)
        }
        
        findPwButton.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(31)
            $0.leading.equalTo(lineView.snp.trailing).offset(36)
            $0.height.equalTo(22)
        }
        
        createNicknameLabel.snp.makeConstraints {
            $0.top.equalTo(findIdButton.snp.bottom).offset(28)
            $0.trailing.equalTo(lineView.snp.trailing)
            $0.height.equalTo(22)
            
        }
        
        createNicknameButton.snp.makeConstraints {
            $0.top.equalTo(findIdButton.snp.bottom).offset(28)
            $0.leading.equalTo(lineView.snp.trailing).offset(17)
            $0.height.equalTo(22)
        }
    }
    
    func setDelegate() {
        idTextField.delegate = self
        pwTextField.delegate = self
    }
    
    func clearTextField() {
        [idTextField,pwTextField].forEach {
            $0.text?.removeAll()
        }
        self.loginButton.isEnabled = false
    }
    
    func updateClearButtonUI(textField: UITextField){
        switch textField{
        case idTextField:
            self.idClearButton.isHidden = self.idTextField.isEmpty
        case pwTextField:
            self.pwClearButton.isHidden = self.pwTextField.isEmpty
            self.securityButton.isHidden = self.pwTextField.isEmpty
        default: break
        }
    }
    
    @objc
    func idClearButtonTapped() {
        idTextField.text?.removeAll()
    }
    
    @objc
    func pwClearButtonTapped() {
        pwTextField.text?.removeAll()
    }
    
    @objc
    func securityButtonTapped() {
        pwTextField.isSecureTextEntry.toggle()
    }
    
    @objc
    func presentNickNameButtonTapped() {
        let nicknameViewController = NickNameViewController()
        nicknameViewController.modalTransitionStyle = .coverVertical
        nicknameViewController.modalPresentationStyle = .overFullScreen
        nicknameViewController.completionHandler = { [weak self] text in
            guard let self else { return }
            self.username = text
        }
        self.present(nicknameViewController, animated: false)
    }
    
    @objc
    func presentLoginButtonTapped() {
        guard let id = idTextField.text else { return }
        let username = (username == "") ? id : username
        
        if id.isValidEmail() {
            let welcomeViewController = WelcomeViewController()
            welcomeViewController.modalPresentationStyle = .fullScreen
            welcomeViewController.dataBind(text: username)
            self.present(welcomeViewController, animated: true)
        }
        else {
            makeAlert(title: I18N.Login.inValidIdMessage, message: I18N.Login.inValidIdSubmessage)
            self.loginButton.shakedButton()
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.tvingGray2.cgColor
        updateClearButtonUI(textField: textField)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 0
        [idClearButton, pwClearButton, securityButton].forEach{
            $0.isHidden = true
        }
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        updateClearButtonUI(textField: textField)
        self.loginButton.isEnabled = !(self.idTextField.isEmpty || self.pwTextField.isEmpty)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == idTextField {
            pwTextField.becomeFirstResponder()
        }
        else if textField == pwTextField {
            presentLoginButtonTapped()
        }
        return true
    }
}
