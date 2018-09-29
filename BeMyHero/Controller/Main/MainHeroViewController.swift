//
//  MainHeroViewController.swift
//  BeMyHero
//
//  Created by Rodrigo Vianna on 28/09/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import UIKit

class MainHeroViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        HeroRequester().getHeroes { (result) in
            switch result {
            case .failure(let error): print("error: \(error)")
            case .success(let data): print("Hero: \(data)")
            }
        }
    }

}
