//
//  SafetyTip+Convienience.swift
//  SafeStore
//
//  Created by James Lea on 5/18/23.
//

//import Foundation
//import CoreData
//
//@objc(SafetyTip)
//public class SafetyTip: NSManagedObject {
//    @NSManaged public var title: String
//    @NSManaged public var description: String
//    @NSManaged public var isFavorite: Bool
//}

import Foundation
import CoreData

extension SafetyTip {
    
    @discardableResult convenience init(title: String, desc: String, isFavorite: Bool, context: NSManagedObjectContext = CoreDataStack.context){
        self.init(context: context)
        self.title = title
        self.desc = desc
        self.isFavorite = isFavorite
    }
}

extension SafetyTip {
    static func == (lhs: Entry, rhs: Entry) -> Bool {
        return lhs.title == rhs.title && lhs.description == rhs.description && lhs.isFavorite == rhs.isFavorite
    }
}
