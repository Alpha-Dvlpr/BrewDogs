//
//  CDBrew.swift
//  BrewDogs
//
//  Created by Aarón Granado Amores on 17/3/22.
//

import Foundation

class CDBrews: NSObject, NSCoding {
    
    var data: [CDBrew]
    
    init(data: [CDBrew]) { self.data = data }
    
    required init?(coder: NSCoder) {
        self.data = coder.decodeObject(forKey: CoreDataKeys.cd_brews_data.rawValue) as? [CDBrew] ?? []
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.data, forKey: CoreDataKeys.cd_brews_data.rawValue)
    }
}

class CDBrew: NSObject, NSCoding, Codable {
    
    var food: String
    var brews: [Brew]
    
    init(food: String, brews: [Brew]) {
        self.food = food
        self.brews = brews
    }
    
    required init?(coder: NSCoder) {
        self.food = coder.decodeObject(forKey: CoreDataKeys.cd_brew_food.rawValue) as? String ?? ""
        self.brews = coder.decodeObject(forKey: CoreDataKeys.cd_brew_brews.rawValue) as? [Brew] ?? []
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.food, forKey: CoreDataKeys.cd_brew_food.rawValue)
        coder.encode(self.brews, forKey: CoreDataKeys.cd_brew_brews.rawValue)
    }
}
