//
//  SecondViewController.swift
//  32th_GOSOPT_iOS
//
//  Created by 최영린 on 2023/04/04.
//

import UIKit

final class SecondViewController: UIViewController {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.first_assignment.myImage
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle(I18N.first_assignment.backButton, for: .normal)
        button.backgroundColor = .black
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.shadowOpacity = 10
        button.layer.cornerRadius = 10
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.addTarget(self,
                         action: #selector(backButtonTapped),
                         for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setLayout()
    }
    
    func dataBind(name: String) {
        nameLabel.text = "안녕하세요 ! \(name)님!"
    }
}

private extension SecondViewController {
    
    func setStyle() {
        view.backgroundColor = .white
    }
    
    func setLayout() {
        [nameLabel, myImageView, backButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
                                     nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)])
        
        NSLayoutConstraint.activate([myImageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
                                     myImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     myImageView.widthAnchor.constraint(equalToConstant: 200),
                                     myImageView.heightAnchor.constraint(equalToConstant: 200)])
        
        NSLayoutConstraint.activate([backButton.topAnchor.constraint(equalTo: myImageView.bottomAnchor, constant: 20),
                                     backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     backButton.heightAnchor.constraint(equalToConstant: 48)])
    }
    
    @objc
    func backButtonTapped() {
        if self.navigationController == nil {
            self.dismiss(animated: true, completion: nil)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }

}
