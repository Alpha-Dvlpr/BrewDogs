//
//  CoreDataManager.swift
//  BrewDogs
//
//  Created by Aarón Granado Amores on 17/3/22.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let shared: CoreDataManager = CoreDataManager()
    
    func saveBrews(for food: String, brews: [Brew], completion: @escaping ((Error?) -> Void)) {
        let cdBrews = CDBrew(food: food, brews: brews)
        
        self.getHistory { history in
            if let history = history {
                if !history.data.contains(where: { $0.food == food }) {
                    history.data.append(cdBrews)
                    self.saveHistory(history: history, completion: completion)
                }
            } else {
                let history = CDBrews(data: [cdBrews])
                self.saveHistory(history: history, completion: completion)
            }
        }
    }
    
    func getBrews(for food: String, completion: @escaping (([Brew]) -> Void)) {
        self.getHistory { history in completion(history?.data.first(where: { $0.food == food })?.brews ?? []) }
    }
    
    private func getHistory(completion: @escaping ((CDBrews?) -> Void)) {
        if let history = UserDefaults.standard.object(forKey: "history") as? Data {
            do {
                let decodedHistory = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(history) as? CDBrews
                completion(decodedHistory)
            } catch let error {
                LogManager.err(ErrorModel(error.localizedDescription))
                completion(nil)
            }
        } else {
            LogManager.err(ErrorModel("No history found"))
            completion(nil)
        }
    }
    
    private func saveHistory(history: CDBrews, completion: @escaping ((Error?) -> Void)) {
        do {
            let encodedHistory = try NSKeyedArchiver.archivedData(withRootObject: history, requiringSecureCoding: false)
            UserDefaults.standard.set(encodedHistory, forKey: "history")
            completion(nil)
        } catch let error {
            LogManager.err(ErrorModel(error.localizedDescription))
            completion(error)
        }
    }
}
