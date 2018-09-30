//
//  HeroDetailViewController.swift
//  BeMyHero
//
//  Created by Rodrigo Vianna on 30/09/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import UIKit

class HeroDetailViewController: UIViewController {
    class var instance: HeroDetailViewController {
        let storyboard = UIStoryboard.init(name: "List", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "detail") as! HeroDetailViewController
        return vc
    }
    
    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var heroDescriptionTextView: UITextView!
    
    var hero: Hero!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assert(hero != nil, "A hero must be passed!")
        self.navigationItem.title = hero.name
        heroImageView.downloadImage(from: hero.thumbnail)
        heroDescriptionTextView.text = hero.description
    }
    
    @IBAction func favoriteHeroAction(_ sender: UIBarButtonItem) {
        
    }
    
}
