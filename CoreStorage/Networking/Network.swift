//
//  Network.swift
//  APICaller
//
//  Created by Hitarth Bhatt on 29/07/21.
//

import Foundation
import Alamofire

class Network {
    
    typealias ResponseModel<T: Decodable> = (Result<T, Error>) -> Void
    
    static let shared = Network()
    
     func performRequest<T: Decodable>(_ router: APIProtocol, completion: @escaping ResponseModel<T>) {
        
        let params = !(router.parameters?.isEmpty ?? true) ? router.parameters : nil
        
        AF.request(router.createURL(), method: router.method, parameters: params, encoding: JSONEncoding.default, headers: nil, interceptor: nil, requestModifier: nil).response { response in
            
            switch response.result {
                
            case .success(let data):
                guard let data = data else { return }
                
                do {

//                    let dataVal = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
//                    print(dataVal)

                    let result = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(result))
                } catch let err {
                    completion(.failure(err))
                }
            case .failure(_):
                break
            }
        }
    }
    
    func createUser(param: Parameters, completion: @escaping ResponseModel<UserData>) {
        Network.shared.performRequest(APIRouter.createUser(param: param), completion: completion)
        }
    
    func getUsers(completion: @escaping ResponseModel<UserModel>) {
        Network.shared.performRequest(APIRouter.getUsers, completion: completion)
    }
    
    func deleteUser(id: String, completion: @escaping ResponseModel<UserData>) {
        Network.shared.performRequest(APIRouter.deleteUser(id: id), completion: completion)
        }
    
    func getNews(at pageNo: Int, completion: @escaping ResponseModel<NewsModel>) {
        Network.shared.performRequest(APIRouter.getNews(at: pageNo), completion: completion)
    }
    
}
