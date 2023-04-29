//
//  UITableViewRegisterable.swift
//  TVING_CloneCoding
//
//  Created by 최영린 on 2023/04/26.
//

import UIKit

protocol UITableViewRegisterable {
    static var isFromNib: Bool { get }
    static func register(target: UITableView)
}

extension UITableViewRegisterable where Self: UITableViewCell {
    static func register(target: UITableView) {
        if self.isFromNib {
          target.register(UINib(nibName: Self.className, bundle: nil), forCellReuseIdentifier: Self.className)
        } else {
            target.register(Self.self, forCellReuseIdentifier: Self.className)
        }
    }
}

protocol UITableViewHeaderFooterRegisterable {
    static var isFromNib: Bool { get }
    static func register(target: UITableView)
}

extension UITableViewHeaderFooterRegisterable where Self: UITableViewHeaderFooterView {
    static func register(target: UITableView) {
        if self.isFromNib {
          target.register(UINib(nibName: Self.className, bundle: nil), forHeaderFooterViewReuseIdentifier: Self.className)
        } else {
          target.register(Self.self, forHeaderFooterViewReuseIdentifier: Self.className)
        }
    }
}
