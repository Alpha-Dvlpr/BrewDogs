//
//  Services.swift
//  BrewDogs
//
//  Created by Aarón Granado Amores on 16/3/22.
//

import Foundation

protocol Service {
    static func getBrews(for food: String, completion: @escaping ((Swift.Result<Array<Brew>, ErrorModel>) -> Void))
    static func saveBrews(for food: String, brews: [Brew])
}
