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
    var sortingOrder: SortingOrder = .ascending { didSet { self.finish() } }
    private var originalBrews = [Brew]()
    
    init() { }
    
    func fetchBrews(for food: String) {
        self.originalBrews.removeAll()
        self.coreDataSearch(for: food)
    }
    
    func clearSearch() {
        self.originalBrews.removeAll()
        self.finish(clear: true)
    }
    
    private func coreDataSearch(for food: String) {
        CDServices.getBrews(for: food) { [ weak self ] result in
            guard let wSelf = self else { return }
            
            switch result {
            case .success(let brews):
                if brews.isEmpty {
                    wSelf.networkSearch(for: food)
                } else {
                    wSelf.originalBrews = brews
                    wSelf.finish()
                }
                
            case .failure:
                wSelf.networkSearch(for: food)
            }
        }
    }
    
    private func networkSearch(for food: String) {
        NetServices.getBrews(for: food) { [ weak self ] result in
            guard let wSelf = self else { return }
            
            switch result {
            case .success(let brews):
                wSelf.originalBrews = brews
                wSelf.finish()
                
                CDServices.saveBrews(for: food, brews: brews) { _ in }
                
            case .failure(let error):
                wSelf.finish(error: error.localizedDescription)
            }
        }
    }
    
    private func finish(clear: Bool = false, error: String? = nil) { self.observer?(clear ? false : self.sortedBrews.isEmpty, error) }
}
