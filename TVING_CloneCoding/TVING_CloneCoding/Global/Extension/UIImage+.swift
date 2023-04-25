//
//  UIImage+.swift
//  TVING_CloneCoding
//
//  Created by 최영린 on 2023/04/26.
//

import UIKit

extension UIImage {
    static func load(name: String) -> UIImage {
        guard let image = UIImage(named: name, in: nil, compatibleWith: nil) else {
            return UIImage()
        }
        image.accessibilityIdentifier = name
        return image
    }
}
