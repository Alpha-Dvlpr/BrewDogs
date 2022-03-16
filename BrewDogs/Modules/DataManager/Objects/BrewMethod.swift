//
//  BrewMethod.swift
//  BrewDogs
//
//  Created by Aarón Granado Amores on 16/3/22.
//

import Foundation

struct Mash: Decodable, Encodable {
    var temp: BrewVolume
    var duration: Int?
    
    enum CodingKeys: String, CodingKey {
        case temp, duration
    }
}

struct Fermentation: Decodable, Encodable {
    var temp: BrewVolume
    
    enum CodingKeys: String, CodingKey {
        case temp
    }
}

struct BrewMethod: Decodable, Encodable {
    var mash_temp: [Mash]
    var fermentation: Fermentation
    var twist: String?
    
    enum CodingKeys: String, CodingKey {
        case mash_temp, fermentation, twist
    }
}
