//
//  APIConfiguration.swift
//  APICaller
//
//  Created by Hitarth Bhatt on 29/07/21.
//

import Foundation
import Alamofire

protocol APIProtocol {
    
    var method: HTTPMethod {get}
    var path: String {get}
    var parameters: Parameters? {get}

}

extension APIProtocol {
    
    func createURL() -> URL {
        return URL(string: self.path)!
    }
    
}
