//
//  DatabaseHandler.swift
//  CoreStorage
//
//  Created by Hitarth Bhatt on 04/08/21.
//

import UIKit
import RealmSwift


class DatabaseHandler {
    
    
    func add<T: Object>(_ type: T.Type) -> T? {
        let object = T()
        
        return object
    }
    
    
    func fetch<T: Object>(_ type: T.Type) -> [T] {
        return []
    }
    
    func save() {
       
    }
    
    func delete(_ data: Object) {
        
    }
    
    
}
