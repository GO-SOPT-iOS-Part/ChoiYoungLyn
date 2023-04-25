//
//  UIViewController+.swift
//  TVING-CloneCoding
//
//  Created by 최영린 on 2023/04/13.
//

import UIKit

extension UIViewController {
    
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
