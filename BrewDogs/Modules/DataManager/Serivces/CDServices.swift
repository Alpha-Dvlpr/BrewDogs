//
//  CDServices.swift
//  BrewDogs
//
//  Created by Aarón Granado Amores on 17/3/22.
//

import Foundation

class CDServices: Service {
    static func getBrews(for food: String, completion: @escaping ((Result<Array<Brew>, ErrorModel>) -> Void)) {
        CoreDataManager.shared.getBrews(for: food) { result in completion(.success(result)) }
    }
    
    static func saveBrews(for food: String, brews: [Brew], completion: @escaping ((Result<String, ErrorModel>) -> Void)) {
        CoreDataManager.shared.saveBrews(for: food, brews: brews) { result in
            if let error = result {
                completion(.failure(ErrorModel(error.localizedDescription)))
            } else {
                completion(.success(""))
            }
        }
    }
}
