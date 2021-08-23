//
//  TestViewController.swift
//  NavigationZone
//
//  Created by Hitarth Bhatt on 22/07/21.
//

import UIKit

class TestViewController: BaseViewController {

    @IBOutlet weak var presentButton: UIButton!
    @IBOutlet weak var popButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setup()
    }
      
    func setup() {
        
        popButton.setTitle("", for: .normal)
        presentButton.setTitle("", for: .normal)
        self.title = "Segues"
        
        let rightBarButtonItem = UIBarButtonItem()
        rightBarButtonItem.customView = popButton
        
        let rightBarButtonItem1 = UIBarButtonItem()
        rightBarButtonItem1.customView = presentButton
        
        popButton.addTarget(self, action: #selector(popover), for: .touchUpInside)
        
        navigationItem.setRightBarButtonItems([rightBarButtonItem, rightBarButtonItem1], animated: true)
    }
   
    @objc func popover() {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = sb.instantiateViewController( withIdentifier: "pop") as? PopOverViewController else {return}

        vc.modalPresentationStyle = .popover
        
        let popover: UIPopoverPresentationController = vc.popoverPresentationController!
        let rightBarButtonItem = UIBarButtonItem()
        rightBarButtonItem.customView = popButton
        popover.barButtonItem = rightBarButtonItem
        
        present(vc, animated: true, completion: nil)
        
    }
   
    @IBAction func popToRoot(_ sender: Any) {
        
        navigationController?.popToRootViewController(animated: true)
        
    }
   
}
