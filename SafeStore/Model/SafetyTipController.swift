//
//  SafetyTipController.swift
//  SafeStore
//
//  Created by James Lea on 5/18/23.
//

import Foundation
import CoreData

class SafetyTipController {
    
    
    lazy var fetchRequest: NSFetchRequest<SafetyTip> = {
         let request = NSFetchRequest<SafetyTip>(entityName: "SafetyTip")
         request.predicate = NSPredicate(value: true)
         return request
        }()
    
    func fetchSafetyTips() -> [SafetyTip] {
        return (try? CoreDataStack.context.fetch(self.fetchRequest)) ?? []
    }
    
    func createSafetyTip(title: String, desc: String, isFavorite: Bool) {
        let safetyTip = SafetyTip(title: title, desc: desc, isFavorite: isFavorite)
        CoreDataStack.saveContext()
    }
    
    func updateSafetyTip(safetyTip: SafetyTip, title: String, desc: String, isFavorite: Bool) {
        safetyTip.title = title
        safetyTip.desc = desc
        safetyTip.isFavorite = isFavorite
        
    }
    
    func deleteSafetyTip(safetyTip: SafetyTip) {
        CoreDataStack.delete(safetyTip: safetyTip)
    }
}
