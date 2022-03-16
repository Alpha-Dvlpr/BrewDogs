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
            return self.originalBrews.sorted(by: { $0.abv < $1.abv })
            
        case .descending:
            return self.originalBrews.sorted(by: { $0.abv > $1.abv })
            
        case .none:
            return self.originalBrews
        }
    }
    private var sortingOrder: SortingOrder = .ascending
    private var originalBrews = [Brew]()
    private var networkFetcher: DataManagerProtocol?
    
    init() {
        self.networkFetcher = NetworkFetcher()
    }
    
    func fetchBrews(for food: String) {
        self.originalBrews.removeAll()
        
        self.networkFetcher?.fetchBrews { [ weak self ] (brews, error) in
            guard let wSelf = self else { return }
            
            if let error = error {
                wSelf.finish(error: error)
            } else if let brews = brews {
                wSelf.originalBrews = brews
                wSelf.finish()
            } else {
                wSelf.finish()
            }
        }
    }
    
    func clearSearch() {
        self.originalBrews.removeAll()
        self.finish(clear: true)
    }
    
    private func finish(clear: Bool = false, error: String? = nil) { self.observer?(clear ? false : self.sortedBrews.isEmpty, error) }
}
