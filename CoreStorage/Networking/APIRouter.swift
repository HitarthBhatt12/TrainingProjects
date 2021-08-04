//
//  APIRouter.swift
//  APICaller
//
//  Created by Hitarth Bhatt on 29/07/21.
//

import Foundation
import Alamofire

enum APIRouter: APIProtocol {
    
    case createUser(param: Parameters)
    case getUsers
    case deleteUser(id: String)
    case getNews(at: Int)
    
    var method: HTTPMethod {
        switch self {
        case .createUser(_):
            return .post
            
        case.getUsers:
            return .get
            
        case .deleteUser(_):
            return .delete
            
        case .getNews(_):
            return .get
        
        }
    }
    
    var path: String {
        switch self {
        case .createUser(_):
            return (BaseUrl + CREATEUSER)
            
        case .getUsers:
            return (BaseUrl + GETUSER)
           
        case .deleteUser(let id):
            return (BaseUrl + DELETEUSER + id)
         
        case .getNews(let pageNo):
            return getNewsApi(at: pageNo)
            
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .createUser(let params):
            return params
            
        case .getUsers:
            return [:]
            
        case .deleteUser(_):
            return [:]
            
        case .getNews(_):
            return [:]
            
        }
    }
 
}
