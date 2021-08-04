//
//  AddUserViewModel.swift
//  CoreStorage
//
//  Created by Hitarth Bhatt on 03/08/21.
//

import UIKit

class AddUserViewModel {

    var onSuccess = Dynamic<Void>(())
    var onError = Dynamic<String>("")
   
    func addUser(param: [String: Any]) {
        Network.shared.createUser(param: param) { result in
            switch result {
            case .success(_):
                self.onSuccess.fire()
            case .failure(let error):
                self.onError.value = error.localizedDescription
            }
        }
    }
    
}
