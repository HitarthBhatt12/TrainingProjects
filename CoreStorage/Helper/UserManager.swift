//
//  UserManager.swift
//  CoreStorage
//
//  Created by Hitarth Bhatt on 03/08/21.
//

import UIKit
import CoreData

class UserManager {
    
    static let shared = UserManager()
    
    var context: NSManagedObjectContext {
     return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
}
