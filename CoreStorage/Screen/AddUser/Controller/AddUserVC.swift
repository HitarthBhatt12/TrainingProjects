//
//  AddUserVC.swift
//  CoreStorage
//
//  Created by Hitarth Bhatt on 03/08/21.
//

import UIKit

class AddUserVC: UIViewController, Storyboarded {

    var coordinator: AddUserCoordinator?
    let addUserModel = AddUserViewModel()
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var imageField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        // Do any additional setup after loading the view.
    }

    func bindViewModel() {
        self.addUserModel.onSuccess.bind { _ in
            self.dismiss(animated: true, completion: nil)
        }
        self.addUserModel.onError.bind { error in
            print(error)
        }
    }
    
    @IBAction func didTapSaveBtn(_ sender: Any) {
        
        let param = ["name": nameField.text,
                     "email": emailField.text,
                     "image": imageField.text]
        
        self.addUserModel.addUser(param: param as [String : Any])
        
    }
    
}
