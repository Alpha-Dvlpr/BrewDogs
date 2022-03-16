//
//  BrewRequest.swift
//  BrewDogs
//
//  Created by Aarón Granado Amores on 16/3/22.
//

import Foundation

class BrewRequest: RequestModel {
    
    private var food: String
    
    init(food: String) { self.food = food }
    
    override var endpoint: String { return "https://api.punkapi.com/v2" }
    override var path: String { return "/beers" }
    override var parameters: [String : Any?] { return ["food": self.food] }
}
