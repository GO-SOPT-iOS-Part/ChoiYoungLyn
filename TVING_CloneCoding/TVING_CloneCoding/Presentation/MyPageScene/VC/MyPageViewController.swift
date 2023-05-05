//
//  MyPageViewController.swift
//  TVING_CloneCoding
//
//  Created by 최영린 on 2023/04/25.
//

import UIKit

final class MyPageViewController: BaseViewController {
    
    // MARK: - UI Components
     
    private let myPageTableView = MyPageTableView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        self.view = myPageTableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationUI()
    }
}

// MARK: - Extensions

private extension MyPageViewController {
    
    func setNavigationUI() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: ImageLiterals.Common.beforeBtn, style: .plain, target: self, action: #selector(backButtonTapped))
        let notification = navigationItem.setRightButtonUI(self, imageName: UIImage(systemName: "bell"))
        let setting = navigationItem.setRightButtonUI(self, imageName: UIImage(systemName: "gearshape"))
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spacer.width = 9
        navigationItem.rightBarButtonItems = [setting, spacer, notification]
    }
    
    @objc func backButtonTapped() {
        self.navigationController?.popViewController(animated: false)
    }
}
