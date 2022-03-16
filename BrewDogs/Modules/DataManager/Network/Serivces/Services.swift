//
//  Services.swift
//  BrewDogs
//
//  Created by Aarón Granado Amores on 16/3/22.
//

import Foundation

class Services {
    class func getBrews(for food: String, completion: @escaping ((Swift.Result<[Brew], ErrorModel>) -> Void)) {
        ServiceManager.shared.sendRequest(request: BrewRequest(food: food), completion: completion)
    }
}
