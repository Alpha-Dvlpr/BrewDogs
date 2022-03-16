//
//  NetworkFetcher.swift
//  BrewDogs
//
//  Created by Aarón Granado Amores on 16/3/22.
//

import Foundation

class NetworkFetcher: DataManagerProtocol {
    func fetchBrews(completion: @escaping (([Brew]?, String?) -> Void)) {
        guard let url = URL(string: "https://api.punkapi.com/v2/")
        else {
            completion(nil, "La URL solicitada no existe")
            return
        }
        
        URLSession.shared.fetchData(at: url) { result in
            switch result {
            case .success(let brews):
                completion(brews, nil)
                
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
        }
    }
}

extension URLSession {
    func fetchData(at url: URL, completion: @escaping ((Result<[Brew], Error>) -> Void)) {
        self.dataTask(with: url) { (data, response, error) in
            if let error = error { completion(.failure(error)) }
            
            if let data = data {
                do {
                    let brews = try JSONDecoder().decode([Brew].self, from: data)
                    completion(.success(brews))
                } catch let decodeError {
                    completion(.failure(decodeError))
                }
            }
        }.resume()
    }
}
