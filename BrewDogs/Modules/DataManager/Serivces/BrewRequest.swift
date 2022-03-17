//
//  BrewRequest.swift
//  BrewDogs
//
//  Created by Aarón Granado Amores on 16/3/22.
//

import Foundation

class APIBrewRequest: RequestModel {
    
    private var food: String
    
    init(food: String) { self.food = food }
    
    override var endpoint: String { return "https://api.punkapi.com/v2" }
    override var path: String { return "/beers" }
    override var parameters: [String : Any?] { return ["food": self.food] }
}

class CDBrewRequest: RequestModel {
    
    private var food: String
    private var brews: [Brew]
    private var meth: RequestHTTPMethod
    
    init(food: String, brews: [Brew] = [], meth: RequestHTTPMethod) {
        self.food = food
        self.brews = brews
        self.meth = meth
    }
    
    override var endpoint: String { return "brews" }
    override var method: RequestHTTPMethod { return self.meth }
    override var data: Decodable? { return CDBrew(food: self.food, brews: self.brews) }
}
