//
//  BrewMethod.swift
//  BrewDogs
//
//  Created by Aarón Granado Amores on 16/3/22.
//

import Foundation

struct Mash: Codable {
    var temp: BrewVolume
    var duration: Int?
}

struct Fermentation: Codable {
    var temp: BrewVolume
}

struct BrewMethod: Codable {
    var mash_temp: [Mash]
    var fermentation: Fermentation
    var twist: String?
}
