//
//  Hero.swift
//  BeMyHero
//
//  Created by Rodrigo Vianna on 29/09/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import Foundation
import SwiftyJSON

class Hero: NSObject, NSCoding {
    var identifier: String
    var name: String
    var descriptionHero: String
    var thumbnail: String
    var resourceURI: String
    var comics: [Item]
    var series: [Item]
    var stories: [Item]
    
    init(identifier: String, name: String, description: String, thumbnail: String, resourceURI: String, comics: [Item], series: [Item], stories: [Item]) {
        self.identifier = identifier
        self.name = name
        self.descriptionHero = description
        self.thumbnail = thumbnail
        self.resourceURI = resourceURI
        self.comics = comics
        self.series = series
        self.stories = stories
    }
    
    init(withJSON json: JSON) {
        identifier = json["id"].stringValue
        name = json["name"].stringValue
        descriptionHero = json["description"].stringValue
        thumbnail = "\(json["thumbnail"]["path"].stringValue).\(json["thumbnail"]["extension"].stringValue)"
        resourceURI = json["resourceURI"].stringValue
        comics = json["comics"].arrayValue.compactMap { Item.init(withJSON: $0) }
        series = json["series"].arrayValue.compactMap { Item.init(withJSON: $0) }
        stories = json["stories"].arrayValue.compactMap { Item.init(withJSON: $0) }
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        let identifier = aDecoder.decodeObject(forKey: "identifier") as! String
        let name = aDecoder.decodeObject(forKey: "name") as! String
        let description = aDecoder.decodeObject(forKey: "description") as! String
        let thumbnail = aDecoder.decodeObject(forKey: "thumbnail") as! String
        let resourceURI = aDecoder.decodeObject(forKey: "resourceURI") as! String
        let comics = aDecoder.decodeObject(forKey: "comics") as! [Item]
        let series = aDecoder.decodeObject(forKey: "series") as! [Item]
        let stories = aDecoder.decodeObject(forKey: "stories") as! [Item]
        
        self.init(identifier: identifier, name: name, description: description, thumbnail: thumbnail, resourceURI: resourceURI, comics: comics, series: series, stories: stories)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(identifier, forKey: "identifier")
        aCoder.encode(name, forKey: "name")
        aCoder.encode(descriptionHero, forKey: "description")
        aCoder.encode(thumbnail, forKey: "thumbnail")
        aCoder.encode(resourceURI, forKey: "resourceURI")
        aCoder.encode(comics, forKey: "comics")
        aCoder.encode(series, forKey: "series")
        aCoder.encode(stories, forKey: "stories")
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
