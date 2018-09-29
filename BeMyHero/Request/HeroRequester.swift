//
//  HeroRequester.swift
//  BeMyHero
//
//  Created by Rodrigo Vianna on 28/09/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class HeroRequester {
    func getHeroes(completion: @escaping(Result<[Hero]>)-> Void) {
        let path = "/characters"
        BaseRequester.shared.baseRequest(path: path, httpMethod: .get) { (response) in
            switch response.result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                let heroes = JSON(data)["data"]["results"].arrayValue.compactMap { Hero.init(withJSON: $0) }
                completion(.success(heroes))
            }
        }
    }
}
