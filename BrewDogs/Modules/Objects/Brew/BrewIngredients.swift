//
//  BrewIngredients.swift
//  BrewDogs
//
//  Created by Aarón Granado Amores on 16/3/22.
//

import Foundation

enum Attribute: String, Codable {
    case aroma = "aroma"
    case attributeAroma = "Aroma"
    case attributeFlavour = "Flavour"
    case bitter = "bitter"
    case bittering = "Bittering"
    case flavour = "flavour"
}

class Hop: NSObject, NSCoding, Codable {
    let name: String
    let amount: BoilVolume
    let add: String
    let attribute: Attribute

    init(name: String, amount: BoilVolume, add: String, attribute: Attribute) {
        self.name = name
        self.amount = amount
        self.add = add
        self.attribute = attribute
    }
    
    required init?(coder: NSCoder) {
        self.name = coder.decodeObject(forKey: CoreDataKeys.cd_hop_name.rawValue) as? String ?? ""
        self.amount = coder.decodeObject(forKey: CoreDataKeys.cd_hop_amount.rawValue) as? BoilVolume ?? BoilVolume(value: 0, unit: .celsius)
        self.add = coder.decodeObject(forKey: CoreDataKeys.cd_hop_add.rawValue) as? String ?? ""
        self.attribute = coder.decodeObject(forKey: CoreDataKeys.cd_hop_attribute.rawValue) as? Attribute ?? .aroma
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.name, forKey: CoreDataKeys.cd_hop_name.rawValue)
        coder.encode(self.amount, forKey: CoreDataKeys.cd_hop_amount.rawValue)
        coder.encode(self.add, forKey: CoreDataKeys.cd_hop_add.rawValue)
        coder.encode(self.attribute, forKey: CoreDataKeys.cd_hop_attribute.rawValue)
    }
}

class Malt: NSObject, NSCoding, Codable {
    let name: String
    let amount: BoilVolume

    init(name: String, amount: BoilVolume) {
        self.name = name
        self.amount = amount
    }
    
    required init?(coder: NSCoder) {
        self.name = coder.decodeObject(forKey: CoreDataKeys.cd_malt_name.rawValue) as? String ?? ""
        self.amount = coder.decodeObject(forKey: CoreDataKeys.cd_malt_amount.rawValue) as? BoilVolume ?? BoilVolume(value: 0, unit: .celsius)
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.name, forKey: CoreDataKeys.cd_malt_name.rawValue)
        coder.encode(self.amount, forKey: CoreDataKeys.cd_malt_amount.rawValue)
    }
}

class Ingredients: NSObject, NSCoding, Codable {
    let malt: [Malt]
    let hops: [Hop]
    let yeast: String
    
    init(malt: [Malt], hops: [Hop], yeast: String) {
        self.malt = malt
        self.hops = hops
        self.yeast = yeast
    }
    
    required init?(coder: NSCoder) {
        self.malt = coder.decodeObject(forKey: CoreDataKeys.cd_ingredients_malt.rawValue) as? [Malt] ?? []
        self.hops = coder.decodeObject(forKey: CoreDataKeys.cd_ingredients_hops.rawValue) as? [Hop] ?? []
        self.yeast = coder.decodeObject(forKey: CoreDataKeys.cd_ingredients_yeast.rawValue) as? String ?? ""
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.malt, forKey: CoreDataKeys.cd_ingredients_malt.rawValue)
        coder.encode(self.hops, forKey: CoreDataKeys.cd_ingredients_hops.rawValue)
        coder.encode(self.yeast, forKey: CoreDataKeys.cd_ingredients_yeast.rawValue)
    }
}
