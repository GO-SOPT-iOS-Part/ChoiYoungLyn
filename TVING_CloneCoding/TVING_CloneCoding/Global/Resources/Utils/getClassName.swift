//
//  getClassName.swift
//  TVING_CloneCoding
//
//  Created by 최영린 on 2023/04/26.
//

import Foundation

extension NSObject {
    
    static var className: String {
        NSStringFromClass(self.classForCoder()).components(separatedBy: ".").last!
    }
    
}
