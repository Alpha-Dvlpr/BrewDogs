//
//  ImageRequest.swift
//  BrewDogs
//
//  Created by Aarón Granado Amores on 16/3/22.
//

import Foundation

class ImageRequest: RequestModel {
    
    var url: String = ""
    
    init(with url: String) { self.url = url }
    
    override var endpoint: String { return self.url }
}
