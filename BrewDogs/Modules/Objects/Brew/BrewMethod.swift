//
//  BrewMethod.swift
//  BrewDogs
//
//  Created by Aarón Granado Amores on 16/3/22.
//

import Foundation

class Method: NSObject, NSCoding, Codable {
    let mashTemp: [MashTemp]
    let fermentation: Fermentation
    let twist: String?

    enum CodingKeys: String, CodingKey {
        case mashTemp = "mash_temp"
        case fermentation, twist
    }

    init(mashTemp: [MashTemp], fermentation: Fermentation, twist: String?) {
        self.mashTemp = mashTemp
        self.fermentation = fermentation
        self.twist = twist
    }
    
    required init?(coder: NSCoder) {
        let auxFermentation = Fermentation(temp: BoilVolume(value: 0, unit: .celsius))
        
        self.mashTemp = coder.decodeObject(forKey: CoreDataKeys.cd_method_mash_temp.rawValue) as? [MashTemp] ?? []
        self.fermentation = coder.decodeObject(forKey: CoreDataKeys.cd_method_fermentation.rawValue) as? Fermentation ?? auxFermentation
        self.twist = coder.decodeObject(forKey: CoreDataKeys.cd_method_twist.rawValue) as? String ?? ""
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.mashTemp, forKey: CoreDataKeys.cd_method_mash_temp.rawValue)
        coder.encode(self.fermentation, forKey: CoreDataKeys.cd_method_fermentation.rawValue)
        coder.encode(self.twist, forKey: CoreDataKeys.cd_method_twist.rawValue)
    }
}

class Fermentation: NSObject, NSCoding, Codable {
    let temp: BoilVolume

    init(temp: BoilVolume) { self.temp = temp }
    
    required init?(coder: NSCoder) {
        self.temp = coder.decodeObject(forKey: CoreDataKeys.cd_fermentation_temp.rawValue) as? BoilVolume ?? BoilVolume(value: 0, unit: .celsius)
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.temp, forKey: CoreDataKeys.cd_fermentation_temp.rawValue)
    }
}

class MashTemp: NSObject, NSCoding, Codable {
    let temp: BoilVolume
    let duration: Int?

    init(temp: BoilVolume, duration: Int?) {
        self.temp = temp
        self.duration = duration
    }
    
    required init?(coder: NSCoder) {
        self.temp = coder.decodeObject(forKey: CoreDataKeys.cd_mash_temp.rawValue) as? BoilVolume ?? BoilVolume(value: 0, unit: .celsius)
        self.duration = coder.decodeInteger(forKey: CoreDataKeys.cd_mash_duration.rawValue)
        
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.temp, forKey: CoreDataKeys.cd_mash_temp.rawValue)
        coder.encode(self.duration, forKey: CoreDataKeys.cd_mash_duration.rawValue)
    }
}
