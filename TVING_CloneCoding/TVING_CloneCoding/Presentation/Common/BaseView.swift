//
//  BaseView.swift
//  TVING_CloneCoding
//
//  Created by 최영린 on 2023/04/25.
//

import UIKit

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {}
    func setLayout() {}
}
