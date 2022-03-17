//
//  BrewIngredients.swift
//  BrewDogs
//
//  Created by Aarón Granado Amores on 16/3/22.
//

import Foundation

struct Ingredient: Codable {
    var name: String
    var amount: BrewVolume
    var add: String?
    var attribute: String?
}

struct BrewIngredients: Codable {
    var malt: [Ingredient]
    var hops: [Ingredient]
    var yeast: String
}
