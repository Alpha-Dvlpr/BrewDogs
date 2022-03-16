//
//  MainVM.swift
//  BrewDogs
//
//  Created by Aarón Granado Amores on 16/3/22.
//

import Foundation

class MainVM {
    
    var observer: ((_ empty: Bool, _ error: String?) -> Void)?
    var sortedBrews: [Brew] {
        switch self.sortingOrder {
        case .ascending:
            return self.originalBrews.sorted(by: { $0.abv ?? 0 < $1.abv ?? 0 })
            
        case .descending:
            return self.originalBrews.sorted(by: { $0.abv ?? 0 > $1.abv ?? 0 })
            
        case .none:
            return self.originalBrews
        }
    }
    private var sortingOrder: SortingOrder = .ascending
    private var originalBrews = [Brew]()
    
    init() { }
    
    func fetchBrews(for food: String) {
        self.originalBrews.removeAll()
        
        Services.getBrews(for: food) { [ weak self ] result in
            guard let wSelf = self else { return }
            
            switch result {
            case .success(let brews):
                wSelf.originalBrews = brews
                wSelf.finish()
                
            case .failure(let error):
                wSelf.finish(error: error.localizedDescription)
            }
        }
    }
    
    func clearSearch() {
        self.originalBrews.removeAll()
        self.finish(clear: true)
    }
    
    private func finish(clear: Bool = false, error: String? = nil) { self.observer?(clear ? false : self.sortedBrews.isEmpty, error) }
}
