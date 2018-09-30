//
//  MainHeroViewController.swift
//  BeMyHero
//
//  Created by Rodrigo Vianna on 28/09/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import UIKit

enum Random: String {
    case dead = "deadpool"
    case iron = "iron%20man"
    case hulk = "hulk"
    case wolverine = "wolverine"
    case cyclops = "cyclops"
    case jean = "jean%20grey"
    case cable = "cable"
}


class MainHeroViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HeroRequester().getHeroBy(name: "deadpool") { (result) in
            switch result {
            case .failure(let error): print("\(error)")
            case .success(let data): print("Hero: \(data)")
            }
        }
    }
}
