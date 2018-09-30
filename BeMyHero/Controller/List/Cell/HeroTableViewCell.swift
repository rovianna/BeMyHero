//
//  HeroTableViewCell.swift
//  BeMyHero
//
//  Created by Rodrigo Vianna on 29/09/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import UIKit

class HeroTableViewCell: UITableViewCell {
    
    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var heroNameLabel: UILabel!
    
    
    func configure(hero: Hero) {
        heroImageView.downloadImage(from: hero.thumbnail)
        heroNameLabel.text = hero.name
    }
    
}
