//
//  DatabaseHandler.swift
//  CoreStorage
//
//  Created by Hitarth Bhatt on 04/08/21.
//

import UIKit
import CoreData


class DatabaseHandler {
    
    static let shared = DatabaseHandler()
    let context = UserManager.shared.context
    
    func add<T: NSManagedObject>(_ type: T.Type) -> T? {
        guard let entityName = T.entity().name else { return nil }
        guard let entity = NSEntityDescription.entity(forEntityName: entityName, in: context) else {return nil}
        let object = T(entity: entity, insertInto: context)
        
        return object
    }
    
    
    func fetch<T: NSManagedObject>(_ type: T.Type) -> [T] {
        let request = T.fetchRequest()
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            return result as! [T]
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    func save() {
        do {
            try context.save()
        } catch {
            print("Saving Error", error.localizedDescription)
        }
    }
    
    func delete(_ data: NSManagedObject) {
        context.delete(data)
        save()
    }
    
    
}
