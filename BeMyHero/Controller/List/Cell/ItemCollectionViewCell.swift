//
//  ItemCollectionViewCell.swift
//  BeMyHero
//
//  Created by Rodrigo Vianna on 30/09/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var itemImageView: UIImageView!
    
    @IBOutlet weak var itemDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(item: Item) {
        itemImageView.downloadImage(from: item.resourceURI)
        itemDescriptionLabel.text = item.name
    }
}
