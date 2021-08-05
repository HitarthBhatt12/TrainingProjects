//
//  DatabaseHandler.swift
//  CoreStorage
//
//  Created by Hitarth Bhatt on 04/08/21.
//

import UIKit
import RealmSwift
import FMDB


class DatabaseHandler {
    
    static var shared: DatabaseHandler = DatabaseHandler()
    var realm: Realm?
    
    let fileManager = FileManager.default
    var database: FMDatabase?
    var databaseURL: URL?
    
    init() {
        do {
            databaseURL = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("DBConstants.dbFileName")
        } catch {
            print(error)
        }
        if let dbURL = databaseURL {
            if !fileManager.fileExists(atPath: dbURL.path) {
                fileManager.createFile(atPath: dbURL.path, contents: nil, attributes: [:])
            }
            database = FMDatabase(url: dbURL)
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
        }catch {
            print("error in saving data", error.localizedDescription)
        }
    }
    
    func delete(_ data: Object) {
        self.realm?.delete(data)
    }
    
    
}
