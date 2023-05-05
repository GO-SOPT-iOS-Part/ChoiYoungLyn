//
//  MainViewController.swift
//  TVING_CloneCoding
//
//  Created by 최영린 on 2023/05/01.
//

import UIKit

final class HomeViewController: BaseViewController {

    // MARK: - UI Components
    
    private let homeView = HomeView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setUI() {
        self.navigationController?.navigationBar.isHidden = true;
    }
}
