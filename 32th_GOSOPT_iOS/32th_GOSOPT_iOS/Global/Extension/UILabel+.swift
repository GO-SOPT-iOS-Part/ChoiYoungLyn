//
//  UILabel+.swift
//  32th_GOSOPT_iOS
//
//  Created by 최영린 on 2023/04/05.
//

import UIKit

extension UILabel {
    func partColorChange(targetString: String, textColor: UIColor) {
        let fullText = self.text ?? ""
        let range = (fullText as NSString).range(of: targetString)
        let attributedString = NSMutableAttributedString(string: fullText)
        attributedString.addAttribute(.foregroundColor, value: textColor, range: range)
        self.attributedText = attributedString
    }
}
