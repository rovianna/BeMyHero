//
//  HeroesListDataSource.swift
//  BeMyHero
//
//  Created by Rodrigo Vianna on 29/09/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import UIKit

fileprivate let nib = UINib(nibName: "HeroTableViewCell", bundle: nil)
fileprivate let showMore = UINib(nibName: "ShowMoreTableViewCell", bundle: nil)

protocol HeroesListDataSourceDelegate {
    func heroesListDataSourceDelegate(_ heroesListDataSource: HeroesListDataSource, didChoose hero: Hero)
    func heroesListDataSourceDelegate(_ heroesListDataSource: HeroesListDataSource)
}

class HeroesListDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    weak var tableView: UITableView?
    
    var heroes = [Hero]() {
        didSet {
            onMain {
                self.tableView?.reloadData()
            }
        }
    }
    
    var delegate: HeroesListDataSourceDelegate?
    
    init(tableView: UITableView, heroes: [Hero]) {
        super.init()
        self.heroes = heroes
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView = tableView
        self.tableView?.rowHeight = 100
        self.tableView?.estimatedRowHeight = UITableView.automaticDimension
    }
    
    
    func onMain(block: @escaping ()->()) {
        DispatchQueue.main.async {
            block()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < heroes.count {
            let hero = heroes[indexPath.row]
            tableView.register(nib, forCellReuseIdentifier: "hero")
            let cell = tableView.dequeueReusableCell(withIdentifier: "hero", for: indexPath) as! HeroTableViewCell
            cell.configure(hero: hero)
            return cell
        } else {
            tableView.register(showMore, forCellReuseIdentifier: "more")
            let cell = tableView.dequeueReusableCell(withIdentifier: "more", for: indexPath) as! ShowMoreTableViewCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row < heroes.count {
            let hero = heroes[indexPath.row]
            delegate?.heroesListDataSourceDelegate(self, didChoose: hero)
        } else {
            delegate?.heroesListDataSourceDelegate(self)
        }
    }
}
