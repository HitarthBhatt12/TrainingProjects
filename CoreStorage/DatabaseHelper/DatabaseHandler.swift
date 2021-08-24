//
//  DatabaseHandler.swift
//  CoreStorage
//
//  Created by Hitarth Bhatt on 04/08/21.
//

import UIKit
import RealmSwift

class DatabaseHandler {
    
    static var shared: DatabaseHandler = DatabaseHandler()
    var realm: Realm?
    
    init() {
        do {
            self.realm = try Realm()
        } catch {
            print("Error in setup Realm ", error.localizedDescription)
        }
    }
    
    func add<T: Object>(_ type: T.Type) -> T? {
        let object = T()
        return object
    }
    
    func fetch<T: Object>(_ type: T.Type) -> Results<T>? {
        let result = realm?.objects(type)
        return result
    }
    
    func save<T: Object>(_ data: T) {
        do {
            try self.realm?.write {
                realm?.add(data)
            }
        } catch {
            print("error in saving data", error.localizedDescription)
        }
    }
    
    func delete(_ data: Object) {
        self.realm?.delete(data)
    }
    
}
