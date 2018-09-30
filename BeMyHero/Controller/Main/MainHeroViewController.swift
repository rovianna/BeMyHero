//
//  MainHeroViewController.swift
//  BeMyHero
//
//  Created by Rodrigo Vianna on 28/09/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import UIKit

class MainHeroViewController: UIViewController {
    
    @IBOutlet weak var dailyHeroImageView: RoundedImage!
    @IBOutlet weak var dailyHeroLabel: UILabel!
    @IBOutlet weak var dailyHeroDescriptionLabel: UILabel!
    
    fileprivate let randomHero: [String] = ["deadpool", "iron%20man", "hulk", "wolverine", "cyclops", "jean%20grey", "cable"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        HeroRequester().getHeroBy(name: randomHero.randomElement() ?? "deadpool") { (result) in
            switch result {
            case .failure(let error): print("\(error)")
            case .success(let hero):
                self.dailyHeroImageView.downloadImage(from: hero.thumbnail)
                self.dailyHeroLabel.text = hero.name
                self.dailyHeroDescriptionLabel.text = hero.description
            }
        }
    }
}
