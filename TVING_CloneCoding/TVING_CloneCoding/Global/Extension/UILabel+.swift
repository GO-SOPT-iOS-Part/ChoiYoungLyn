//
//  UILabel+.swift
//  TVING_CloneCoding
//
//  Created by 최영린 on 2023/04/29.
//

import UIKit

extension UILabel {
    func labelWithImg(composition: NSAttributedString..., spacing: CGFloat) {
        let attributedString = NSMutableAttributedString()
        for i in composition {
            attributedString.append(i)
        }
        
        let style = NSMutableParagraphStyle()
        style.lineSpacing = spacing
        attributedString.addAttribute(.paragraphStyle,
                                      value: style,
                                      range: NSRange(location: 0, length: attributedString.length))
        
        self.attributedText = attributedString
    }
}
