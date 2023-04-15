//
//  FontLiterals.swift
//  TVING-CloneCoding
//
//  Created by 최영린 on 2023/04/09.
//

import UIKit

struct FontName {
    static let PretendardBold = "Pretendard-Bold"
    static let PretendardMedium = "Pretendard-Medium"
    static let PretendardRegular = "Pretendard-Regular"
    static let PretendardSemiBold = "Pretendard-SemiBold"
}

extension UIFont {
    @nonobjc class func PretendardBold(size: CGFloat) -> UIFont {
        return UIFont(name: FontName.PretendardBold, size: size)!
    }
    
    @nonobjc class func PretendardMedium(size: CGFloat) -> UIFont {
        return UIFont(name: FontName.PretendardMedium, size: size)!
    }
    
    @nonobjc class func PretendardRegular(size: CGFloat) -> UIFont {
        return UIFont(name: FontName.PretendardRegular, size: size)!
    }
    
    @nonobjc class func PretendardSemiBold(size: CGFloat) -> UIFont {
        return UIFont(name: FontName.PretendardSemiBold, size: size)!
    }
    
}
