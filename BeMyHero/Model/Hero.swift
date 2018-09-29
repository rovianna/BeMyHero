//
//  Hero.swift
//  BeMyHero
//
//  Created by Rodrigo Vianna on 29/09/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import Foundation
import SwiftyJSON

class Hero {
    var identifier: String
    var name: String
    var description: String
    var thumbnail: String
    var resourceURI: String
    var comics: [Item]
    var series: [Item]
    var stories: [Item]
    
    init(identifier: String, name: String, description: String, thumbnail: String, resourceURI: String, comics: [Item], series: [Item], stories: [Item]) {
        self.identifier = identifier
        self.name = name
        self.description = description
        self.thumbnail = thumbnail
        self.resourceURI = resourceURI
        self.comics = comics
        self.series = series
        self.stories = stories
    }
    
    init(withJSON json: JSON) {
        identifier = json["id"].stringValue
        name = json["name"].stringValue
        description = json["description"].stringValue
        thumbnail = "\(json["thumbnail"]["path"].stringValue).\(json["thumbnail"]["extension"].stringValue)"
        resourceURI = json["resourceURI"].stringValue
        comics = json["comics"].arrayValue.compactMap { Item.init(withJSON: $0) }
        series = json["series"].arrayValue.compactMap { Item.init(withJSON: $0) }
        stories = json["stories"].arrayValue.compactMap { Item.init(withJSON: $0) }
    }
    
}


class Item {
    var resourceURI: String
    var name: String
    
    init(resourceURI: String, name: String) {
        self.resourceURI = resourceURI
        self.name = name
    }
    
    init(withJSON json: JSON) {
        resourceURI = json["resourceURI"].stringValue
        name = json["name"].stringValue
    }
    
}
