//
//  CoreDataManager.swift
//  BrewDogs
//
//  Created by Aarón Granado Amores on 17/3/22.
//

import Foundation

class CoreDataManager {
    
    static let shared: CoreDataManager = CoreDataManager()
    
    func sendRequest<T: Codable>(request: RequestModel, completion: @escaping ((Swift.Result<T, ErrorModel>) -> Void)) {
        completion(.failure(ErrorModel("No data found")))
    }
}
