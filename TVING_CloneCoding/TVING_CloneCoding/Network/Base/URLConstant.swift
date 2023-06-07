//
//  URLConstant.swift
//  TVING_CloneCoding
//
//  Created by 최영린 on 2023/05/10.
//

import Foundation

struct URLConstant {
    
    // MARK: - base URL
    
    static let baseURL = Config.baseURL
    
    // MARK: - img URL
    
    static let imgURL = "https://image.tmdb.org/t/p/original/"
    
    // MARK: - Home
    
    static let nowPlaying = "/3/movie/now_playing?language=ko"
    static let topRated = "/3/movie/top_rated?language=ko"
    static let onTheAir = "/3/tv/on_the_air?language=ko"
    
}
