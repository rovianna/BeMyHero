//
//  HeroesListViewController.swift
//  BeMyHero
//
//  Created by Rodrigo Vianna on 29/09/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import UIKit

class HeroesListViewController: UIViewController {

    @IBOutlet weak var heroesTableView: UITableView!
    
    var heroes = [Hero]() {
        didSet {
            receiveHeroes(heroes)
        }
    }
    
    var source: HeroesListDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadHeroes()
    }
    
    func loadHeroes() {
        HeroRequester().getHeroes { [weak self] (result) in
            switch result {
            case .failure(let error): print("error: \(error)")
            case .success(let data):
                guard let sSelf = self else { return }
                sSelf.heroes = data
            }
        }
    }
    
    func receiveHeroes(_ heroes: [Hero]) {
        let source = HeroesListDataSource(tableView: heroesTableView, heroes: heroes)
        applyDataSource(source: source)
    }
    
    func applyDataSource(source: HeroesListDataSource) {
        source.delegate = self
        self.source = source
        heroesTableView.reloadData()
    }
}

extension HeroesListViewController: HeroesListDataSourceDelegate {
    func heroesListDataSourceDelegate(_ heroesListDataSource: HeroesListDataSource) {
        print("Show more")
    }
    
    func heroesListDataSourceDelegate(_ heroesListDataSource: HeroesListDataSource, didChoose hero: Hero) {
        let detail = HeroDetailViewController.instance
        detail.hero = hero
        show(detail, sender: nil)
    }
}
