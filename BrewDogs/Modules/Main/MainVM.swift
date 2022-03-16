//
//  MainVM.swift
//  BrewDogs
//
//  Created by Aarón Granado Amores on 16/3/22.
//

import Foundation

class MainVM {
    
    var observer: ((_ empty: Bool) -> Void)?
    private var originalBrews = [String]()
    var sortedBrews: [String] { return self.originalBrews.sorted(by: { $0 > $1 }) }
    
    init() { }
    
    func fetchBrews(for food: String) {
        let rand = Int.random(in: 1...10)
        self.originalBrews = ["IPA", "Desperados", "Voll Damm", "Rand\(rand)"]
        
        self.finish()
    }
    
    func clearSearch() {
        self.originalBrews.removeAll()
        self.finish(clear: true)
    }
    
    private func finish(clear: Bool = false) { self.observer?(clear ? false : self.sortedBrews.isEmpty) }
}
