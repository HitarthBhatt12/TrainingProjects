//
//  User.swift
//  CoreStorage
//
//  Created by Hitarth Bhatt on 02/08/21.
//

import Foundation

typealias UserModel = [UserData]

struct UserData: Codable {
    var id: String?
    var name: String?
    var image: String?
    var email: String?
    
    enum CodingKeys: String, CodingKey {
           case id = "_id"
           case name, image, email
       }
    
}
