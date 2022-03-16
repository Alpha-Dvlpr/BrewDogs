//
//  BrewMethod.swift
//  BrewDogs
//
//  Created by Aarón Granado Amores on 16/3/22.
//

import Foundation

struct Mash: Decodable {
    var temp: BrewVolume
    var duration: Int
    
    enum CodingKeys: String, CodingKey {
        case temp, duration
    }
}

struct Fermentation: Decodable {
    var temp: BrewVolume
    
    enum CodingKeys: String, CodingKey {
        case temp
    }
}

struct BrewMethod: Decodable {
    var mash_temp: [Mash]
    var fermentation: Fermentation
    var twist: String?
    
    enum CodingKeys: String, CodingKey {
        case mash_temp, fermentation, twist
    }
}
