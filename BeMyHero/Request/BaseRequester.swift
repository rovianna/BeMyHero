//
//  BaseRequester.swift
//  BeMyHero
//
//  Created by Rodrigo Vianna on 28/09/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import CryptoSwift

typealias callback = ((ResponseWrapper<Any>)-> Void)

enum Result<Value> {
    case success(Value)
    case failure(Error)
}

struct ResponseWrapper<T> {
    var result: Result<T>
}

class MarvelRequesterData {
    static let shared = MarvelRequesterData()
    
    fileprivate var timeStamp: String {
        return "1"
    }
    
    fileprivate var publicAPI: String {
        return "7d25dee031cf5f3b0d95796877799204"
    }
    
    fileprivate var privateKey: String {
        return "6454306651e49dc8ac6976e556839e94092af934"
    }
    
    fileprivate var hash: String {
        return "\(timeStamp)\(privateKey)\(publicAPI)".md5()
    }
    
    struct EnviromentData {
        let host: String
        let clientId: String
    }
    
    var enviroment: EnviromentData {
        return EnviromentData(host: "https://gateway.marvel.com:443/v1/public", clientId: "?ts=\(timeStamp)&apikey=\(publicAPI)&hash=\(hash)")
    }
}

class BaseRequester {
    static let shared = BaseRequester()
    
    func baseRequest(path: String, httpMethod: HTTPMethod, completion: @escaping callback) {
        if let pathRequest = URL(string: "\(MarvelRequesterData.shared.enviroment.host)/\(path)\(MarvelRequesterData.shared.enviroment.clientId)") {
            Alamofire.request(pathRequest, method: httpMethod, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
                switch response.result {
                    case .failure(let error):
                        let wrapper = ResponseWrapper<Any>(result: Result.failure(error))
                        completion(wrapper)
                    case .success(let data):
                        let wrapper = ResponseWrapper<Any>(result: Result.success(data))
                        completion(wrapper)
                }
            }
        }
    }
}
