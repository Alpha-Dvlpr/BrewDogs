//
//  DataManagerProtocol.swift
//  BrewDogs
//
//  Created by Aarón Granado Amores on 16/3/22.
//

import Foundation

protocol DataManagerProtocol: AnyObject {
    func fetchBrews(completion: @escaping ((_ brews: [Brew]?, _ error: String?) -> Void))
}
