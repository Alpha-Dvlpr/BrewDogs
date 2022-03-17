//
//  Brew.swift
//  BrewDogs
//
//  Created by Aarón Granado Amores on 16/3/22.
//

import Foundation

class Brew: NSObject, NSCoding, Codable {
    let id: Int
    let name, tagline, firstBrewed, brewDescription: String
    let imageURL: String?
    let abv: Double
    let ibu: Int?
    let targetFg, targetOg: Int
    let ebc, srm: Double?
    let ph, attenuationLevel: Double
    let volume, boilVolume: BoilVolume
    let method: Method
    let ingredients: Ingredients
    let foodPairing: [String]
    let brewersTips, contributedBy: String

    enum CodingKeys: String, CodingKey {
        case id, name, tagline
        case firstBrewed = "first_brewed"
        case brewDescription = "description"
        case imageURL = "image_url"
        case abv, ibu
        case targetFg = "target_fg"
        case targetOg = "target_og"
        case ebc, srm, ph
        case attenuationLevel = "attenuation_level"
        case volume
        case boilVolume = "boil_volume"
        case method, ingredients
        case foodPairing = "food_pairing"
        case brewersTips = "brewers_tips"
        case contributedBy = "contributed_by"
    }

    init(
        id: Int, name: String, tagline: String, firstBrewed: String, brewDescription: String, imageURL: String?,
        abv: Double, ibu: Int?, targetFg: Int, targetOg: Int, ebc: Double?, srm: Double?, ph: Double,
        attenuationLevel: Double, volume: BoilVolume, boilVolume: BoilVolume, method: Method, ingredients: Ingredients,
        foodPairing: [String], brewersTips: String, contributedBy: String
    ) {
        self.id = id
        self.name = name
        self.tagline = tagline
        self.firstBrewed = firstBrewed
        self.brewDescription = brewDescription
        self.imageURL = imageURL
        self.abv = abv
        self.ibu = ibu
        self.targetFg = targetFg
        self.targetOg = targetOg
        self.ebc = ebc
        self.srm = srm
        self.ph = ph
        self.attenuationLevel = attenuationLevel
        self.volume = volume
        self.boilVolume = boilVolume
        self.method = method
        self.ingredients = ingredients
        self.foodPairing = foodPairing
        self.brewersTips = brewersTips
        self.contributedBy = contributedBy
    }
    
    required init?(coder: NSCoder) {
        let auxVolume = BoilVolume(value: 0, unit: .celsius)
        let auxIngredients = Ingredients(malt: [], hops: [], yeast: "")
        let auxMethod = Method(mashTemp: [], fermentation: Fermentation(temp: auxVolume), twist: nil)
        
        self.id = coder.decodeInteger(forKey: CoreDataKeys.cd_brew_id.rawValue)
        self.name = coder.decodeObject(forKey: CoreDataKeys.cd_brew_name.rawValue) as? String ?? ""
        self.tagline = coder.decodeObject(forKey: CoreDataKeys.cd_brew_tagline.rawValue) as? String ?? ""
        self.firstBrewed = coder.decodeObject(forKey: CoreDataKeys.cd_brew_first_brewed.rawValue) as? String ?? ""
        self.brewDescription = coder.decodeObject(forKey: CoreDataKeys.cd_brew_description.rawValue) as? String ?? ""
        self.imageURL = coder.decodeObject(forKey: CoreDataKeys.cd_brew_image_url.rawValue) as? String
        self.abv = coder.decodeDouble(forKey: CoreDataKeys.cd_brew_abv.rawValue)
        self.ibu = coder.decodeInteger(forKey: CoreDataKeys.cd_brew_ibu.rawValue)
        self.targetFg = coder.decodeInteger(forKey: CoreDataKeys.cd_brew_target_fg.rawValue)
        self.targetOg = coder.decodeInteger(forKey: CoreDataKeys.cd_brew_target_og.rawValue)
        self.ebc = coder.decodeDouble(forKey: CoreDataKeys.cd_brew_ebc.rawValue)
        self.srm = coder.decodeDouble(forKey: CoreDataKeys.cd_brew_srm.rawValue)
        self.ph = coder.decodeDouble(forKey: CoreDataKeys.cd_brew_ph.rawValue)
        self.attenuationLevel = coder.decodeDouble(forKey: CoreDataKeys.cd_brew_attenuation_level.rawValue)
        self.volume = coder.decodeObject(forKey: CoreDataKeys.cd_brew_volume.rawValue) as? BoilVolume ?? auxVolume
        self.boilVolume = coder.decodeObject(forKey: CoreDataKeys.cd_brew_boil_volume.rawValue) as? BoilVolume ?? auxVolume
        self.method = coder.decodeObject(forKey: CoreDataKeys.cd_brew_method.rawValue) as? Method ?? auxMethod
        self.ingredients = coder.decodeObject(forKey: CoreDataKeys.cd_brew_ingredients.rawValue) as? Ingredients ?? auxIngredients
        self.foodPairing = coder.decodeObject(forKey: CoreDataKeys.cd_brew_food_pairing.rawValue) as? [String] ?? []
        self.brewersTips = coder.decodeObject(forKey: CoreDataKeys.cd_brew_brewers_tips.rawValue) as? String ?? ""
        self.contributedBy = coder.decodeObject(forKey: CoreDataKeys.cd_brew_contributed_by.rawValue) as? String ?? ""
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.id, forKey: CoreDataKeys.cd_brew_id.rawValue)
        coder.encode(self.name, forKey: CoreDataKeys.cd_brew_name.rawValue)
        coder.encode(self.tagline, forKey: CoreDataKeys.cd_brew_tagline.rawValue)
        coder.encode(self.firstBrewed, forKey: CoreDataKeys.cd_brew_first_brewed.rawValue)
        coder.encode(self.brewDescription, forKey: CoreDataKeys.cd_brew_description.rawValue)
        coder.encode(self.imageURL, forKey: CoreDataKeys.cd_brew_image_url.rawValue)
        coder.encode(self.abv, forKey: CoreDataKeys.cd_brew_abv.rawValue)
        coder.encode(self.ibu, forKey: CoreDataKeys.cd_brew_ibu.rawValue)
        coder.encode(self.targetFg, forKey: CoreDataKeys.cd_brew_target_fg.rawValue)
        coder.encode(self.targetOg, forKey: CoreDataKeys.cd_brew_target_og.rawValue)
        coder.encode(self.ebc, forKey: CoreDataKeys.cd_brew_ebc.rawValue)
        coder.encode(self.srm, forKey: CoreDataKeys.cd_brew_srm.rawValue)
        coder.encode(self.ph, forKey: CoreDataKeys.cd_brew_ph.rawValue)
        coder.encode(self.attenuationLevel, forKey: CoreDataKeys.cd_brew_attenuation_level.rawValue)
        coder.encode(self.volume, forKey: CoreDataKeys.cd_brew_volume.rawValue)
        coder.encode(self.boilVolume, forKey: CoreDataKeys.cd_brew_boil_volume.rawValue)
        coder.encode(self.method, forKey: CoreDataKeys.cd_brew_method.rawValue)
        coder.encode(self.ingredients, forKey: CoreDataKeys.cd_brew_ingredients.rawValue)
        coder.encode(self.foodPairing, forKey: CoreDataKeys.cd_brew_food_pairing.rawValue)
        coder.encode(self.brewersTips, forKey: CoreDataKeys.cd_brew_brewers_tips.rawValue)
        coder.encode(self.contributedBy, forKey: CoreDataKeys.cd_brew_contributed_by.rawValue)
    }
}
