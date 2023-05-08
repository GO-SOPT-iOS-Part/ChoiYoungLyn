//
//  BaseViewController.swift
//  TVING_CloneCoding
//
//  Created by 최영린 on 2023/04/25.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: Properties
    
    lazy private(set) var className: String = {
      return type(of: self).description().components(separatedBy: ".").last ?? ""
    }()
    
    // MARK: Initializing
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("DEINIT: \(className)")
    }

    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        setLayout()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.barTintColor = .tvingBlack
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    // MARK: UI
   
    func setUI() {
        view.backgroundColor = .tvingBlack
    }
    
    func setLayout() {}
}

