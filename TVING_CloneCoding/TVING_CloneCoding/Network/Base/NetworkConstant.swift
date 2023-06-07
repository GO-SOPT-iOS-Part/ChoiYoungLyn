//
//  NetworkConstant.swift
//  TVING_CloneCoding
//
//  Created by 최영린 on 2023/05/10.
//

import Foundation

import Alamofire

struct NetworkConstant {
    static let noTokenHeader : HTTPHeaders = ["Content-Type": "application/json"]
    static let hasTokenHeader : HTTPHeaders = ["Content-Type": "application/json",
                                               "Authorization": Config.apiKey]
}
