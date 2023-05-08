//
//  UINavigationItem+.swift
//  TVING_CloneCoding
//
//  Created by 최영린 on 2023/04/26.
//

import UIKit

extension UINavigationItem {
    func setRightButtonUI(_ target: Any?, imageName: UIImage?) -> UIBarButtonItem {
        let button = UIButton(type: .system)
        button.setImage((imageName), for: .normal)
        button.tintColor = .tvingGray2

        let barButtonItem = UIBarButtonItem(customView: button)
        barButtonItem.customView?.translatesAutoresizingMaskIntoConstraints = false
        barButtonItem.customView?.widthAnchor.constraint(equalToConstant: 30).isActive = true
        barButtonItem.customView?.heightAnchor.constraint(equalToConstant: 30).isActive = true

        return barButtonItem
    }
}
