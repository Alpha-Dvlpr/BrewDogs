//
//  SortingOrder.swift
//  BrewDogs
//
//  Created by Aarón Granado Amores on 16/3/22.
//

import Foundation

enum SortingOrder: CaseIterable {
    case ascending, descending, none
    
    var display: String {
        switch self {
        case .ascending:
            return "ASC"
            
        case .descending:
            return "DES"
            
        case .none:
            return "NON"
        }
    }
    
    init(from string: String) {
        switch string {
        case "ASC":
            self = .ascending
            
        case "DES":
            self = .descending
            
        default:
            self = .none
        }
    }
}
