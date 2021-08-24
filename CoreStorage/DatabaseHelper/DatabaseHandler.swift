//
//  DatabaseHandler.swift
//  CoreStorage
//
//  Created by Hitarth Bhatt on 04/08/21.
//

import UIKit
import FMDB

class DatabaseHandler {
    
    static var shared: DatabaseHandler = DatabaseHandler()
    
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
            print(dbURL)
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
        
    }
    
    func fetch<T: ResultSet>(from table: String) -> [T] {
        var items: [T] = []
        guard let database = database else { return items }
        database.open()
        let sql = "SELECT * FROM \(table)"
        do {
            let rs: FMResultSet = try database.executeQuery(sql, values: nil)
            while rs.next() {
                items.append(T(resultSet: rs))
            }
        } catch {
            print(error)
        }
        database.close()
        return items
    }
    
    func save(_ data: Article, imageData: Data) {
        database?.open()
        
        database?.executeUpdate("INSERT INTO Article (title,author,articleDescription,urlToImage) VALUES (?,?,?,?)", withArgumentsIn: [data.title ?? "",
                                data.author ?? "",
                                data.articleDescription ?? "",
                                imageData])
        
        database?.close()
    }
    
    func delete(_ id: Int, from table: String) {
        guard let database = database else { return }
        database.open()
        let query = "DELETE from \(table) where id = '\(id)'"
        database.executeUpdate(query, withArgumentsIn: [])
        database.close()
    }
    
}
