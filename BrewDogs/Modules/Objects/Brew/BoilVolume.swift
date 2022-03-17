//
//  BoilVolume.swift
//  BrewDogs
//
//  Created by Aarón Granado Amores on 16/3/22.
//

import Foundation

enum Unit: String, Codable {
    case celsius = "celsius"
    case grams = "grams"
    case kilograms = "kilograms"
    case litres = "litres"
    case total = "total"
}

class BoilVolume: NSObject, NSCoding, Codable {
    var value: Double
    var unit: Unit
    
    init(value: Double, unit: Unit) {
        self.value = value
        self.unit = unit
    }
    
    required init?(coder: NSCoder) {
        self.value = coder.decodeDouble(forKey: CoreDataKeys.cd_volume_value.rawValue)
        self.unit = coder.decodeObject(forKey: CoreDataKeys.cd_volume_unit.rawValue) as? Unit ?? .celsius
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.value, forKey: CoreDataKeys.cd_volume_value.rawValue)
        coder.encode(self.unit, forKey: CoreDataKeys.cd_volume_unit.rawValue)
    }
}
