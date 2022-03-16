//
//  BrewVolume.swift
//  BrewDogs
//
//  Created by Aarón Granado Amores on 16/3/22.
//

import Foundation

struct BrewVolume: Decodable {
    var value: Double
    var unit: String
    
    enum CodingKeys: String, CodingKey {
        case value, unit
    }
}
