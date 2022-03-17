//
//  ServiceManager.swift
//  BrewDogs
//
//  Created by Aarón Granado Amores on 16/3/22.
//

import Foundation

class ServiceManager {
    
    static let shared: ServiceManager = ServiceManager()
    
    func sendRequest<T: Codable>(request: RequestModel, completion: @escaping ((Swift.Result<T, ErrorModel>) -> Void)) {
        if request.isLoggingEnabled.0 { LogManager.req(request) }
        
        func logError(with message: String) {
            let error = ErrorModel(message)
            LogManager.err(error)
            completion(.failure(error))
        }
        
        URLSession.shared.dataTask(with: request.urlRequest()) { (data, response, error) in
            if error != nil { logError(with: ErrorKey.general.rawValue); return }
            
            guard let data = data,
                  let responseModel = try? JSONDecoder().decode(T.self, from: data)
            else { logError(with: ErrorKey.parsing.rawValue); return }
      
            completion(.success(responseModel))
        }.resume()
    }
}
