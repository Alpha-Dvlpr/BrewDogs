//
//  CDServices.swift
//  BrewDogs
//
//  Created by Aarón Granado Amores on 17/3/22.
//

import Foundation

class CDServices: Service {
    static func getBrews(for food: String, completion: @escaping ((Result<Array<Brew>, ErrorModel>) -> Void)) {
        CoreDataManager.shared.sendRequest(request: BrewRequest(food: food), completion: completion)
    }
    
    static func saveBrews(for food: String, brews: [Brew]) {
        
    }
}
