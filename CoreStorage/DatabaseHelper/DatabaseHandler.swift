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
            databaseURL = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("Article.db")
        } catch {
            print(error)
        }
        if let dbURL = databaseURL {
            if !fileManager.fileExists(atPath: dbURL.path) {
                let bundle = Bundle.main.resourceURL
                guard let dbPath = bundle?.appendingPathComponent("Article.db") else {return}
                
                do {
                    try fileManager.copyItem(at: dbPath, to: dbURL)
                } catch {
                    print("Error in copy DB ", error.localizedDescription)
                }
            }
            database = FMDatabase(url: dbURL)
        }
        
        do {
            self.realm = try Realm()
        } catch {
            print("Realm ", error.localizedDescription)
        }
        
    }
    
    func fetch<T: ResultSet>(from table: String) -> [T] {
        var items: [T] = []
        guard let database = database else { return items }
        let sql = "SELECT * FROM \(table)"
        do {
            let rs: FMResultSet = try database.executeQuery(sql, values: nil)
            while rs.next() {
                items.append(T(resultSet: rs))
            }
        } catch {
            print(error)
        }
        return items
    }
    
    func save(_ data: Article) {
        database?.open()
        
        let isSave = database?.executeUpdate("INSERT INTO Article (title,author,articleDescription,urlToImage) VALUES (?,?,?,?)", withArgumentsIn: [data.title ?? "",
                                                data.author ?? "",
                                                data.articleDescription ?? "",
                                                data.urlToImage ?? ""])
        
        database?.close()
        print(isSave)
    }
    
    func delete(_ data: Object) {
//        self.realm?.delete(data)
    }
    
    
}
