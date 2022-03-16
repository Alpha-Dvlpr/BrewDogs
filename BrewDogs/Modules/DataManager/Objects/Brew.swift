//
//  Brew.swift
//  BrewDogs
//
//  Created by Aarón Granado Amores on 16/3/22.
//

import Foundation

struct Brew: Decodable {
    var id: Int
    var name: String
    var tagline: String
    var first_brewed: String
    var description: String
    var image_url: String
    var abv: Double
    var ibu: Double?
    var target_fg: Double
    var target_og: Double
    var ebc: Double?
    var srm: Double?
    var ph: Double?
    var attenuation_level: Double
    var volume: BrewVolume
    var boil_volume: BrewVolume
    var method: BrewMethod
    var ingredients: BrewIngredients
    var food_pairing: [String]
    var brewers_tips: String
    var contributed_by: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, tagline, first_brewed, description, image_url, abv, ibu, target_fg, target_og, ebc, srm, ph, attenuation_level
        case volume, boil_volume, method, ingredients, food_pairing, brewers_tips, contributed_by
    }
}
