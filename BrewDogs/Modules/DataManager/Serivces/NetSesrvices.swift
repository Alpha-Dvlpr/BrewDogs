//
//  NetSesrvices.swift
//  BrewDogs
//
//  Created by Aarón Granado Amores on 17/3/22.
//

import Foundation

class NetServices: Service {
    
    static func getBrews(for food: String, completion: @escaping ((Swift.Result<Array<Brew>, ErrorModel>) -> Void)) {
        ServiceManager.shared.sendRequest(request: BrewRequest(food: food), completion: completion)
    }
    
    static func saveBrews(for food: String, brews: [Brew]) { }
}
