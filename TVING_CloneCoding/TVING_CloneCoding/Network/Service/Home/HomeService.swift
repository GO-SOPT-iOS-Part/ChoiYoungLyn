//
//  HomeService.swift
//  TVING_CloneCoding
//
//  Created by 최영린 on 2023/05/08.
//

import Foundation

import Alamofire

final class HomeService: BaseService {
    
    static let shared = HomeService()
    
    private override init() {}
}

extension HomeService {
    func getNowPlayingAPI(
        completion: @escaping (NetworkResult<Any>) -> Void) {
        let url = Config.baseURL + URLConstant.nowPlaying
        let header: HTTPHeaders = NetworkConstant.hasTokenHeader
        let dataRequest = AF.request(url,
                                     method: .get,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let data = response.data else { return }
                let networkResult = self.judgeStatus(by: statusCode, data, NowPlayingEntity.self)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    func getTopRatedAPI(completion: @escaping (NetworkResult<Any>) -> Void) {
        let url = Config.baseURL + URLConstant.topRated
        let header: HTTPHeaders = NetworkConstant.hasTokenHeader
        let dataRequest = AF.request(url,
                                     method: .get,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let data = response.data else { return }
                let networkResult = self.judgeStatus(by: statusCode, data, TopRatedEntity.self)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    func getPopularAPI(completion: @escaping (NetworkResult<Any>) -> Void) {
        let url = Config.baseURL + URLConstant.onTheAir
        let header: HTTPHeaders = NetworkConstant.hasTokenHeader
        
        let dataRequest = AF.request(url,
                                     method: .get,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let data = response.data else { return }
                let networkResult = self.judgeStatus(by: statusCode, data, PopularEntity.self)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
}
