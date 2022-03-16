//
//  BrewIngredients.swift
//  BrewDogs
//
//  Created by Aarón Granado Amores on 16/3/22.
//

import Foundation

struct Ingredient: Decodable, Encodable {
    var name: String
    var amount: BrewVolume
    var add: String?
    var attribute: String?
    
    enum CodingKeys: String, CodingKey {
        case name, amount, add, attribute
    }
}

struct BrewIngredients: Decodable, Encodable {
    var malt: [Ingredient]
    var hops: [Ingredient]
    var yeast: String
    
    enum CodingKeys: String, CodingKey {
        case malt, hops, yeast
    }
}
