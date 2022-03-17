//
//  CoreDataKeys.swift
//  BrewDogs
//
//  Created by Aarón Granado Amores on 17/3/22.
//

import Foundation

enum CoreDataKeys: String {
    case cd_brews_data
    case cd_brew_food, cd_brew_brews
    case cd_ingredients_malt, cd_ingredients_hops, cd_ingredients_yeast
    case cd_volume_value, cd_volume_unit
    case cd_hop_name, cd_hop_amount, cd_hop_add, cd_hop_attribute
    case cd_malt_name, cd_malt_amount
    case cd_fermentation_temp
    case cd_mash_temp, cd_mash_duration
    case cd_method_mash_temp, cd_method_fermentation, cd_method_twist
    
    case cd_brew_id, cd_brew_name, cd_brew_tagline, cd_brew_first_brewed, cd_brew_description, cd_brew_image_url, cd_brew_abv, cd_brew_ibu
    case cd_brew_target_fg, cd_brew_target_og, cd_brew_ebc, cd_brew_srm, cd_brew_ph, cd_brew_attenuation_level, cd_brew_volume, cd_brew_boil_volume
    case cd_brew_method, cd_brew_ingredients, cd_brew_food_pairing, cd_brew_brewers_tips, cd_brew_contributed_by
}
