//
//  ViewController.swift
//  NavigationZone
//
//  Created by Hitarth Bhatt on 21/07/21.
//

import UIKit

class ViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var tables: [Table] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: "UserTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        
        setup()
    }


    
    func setup() {
        
        tables.append(   Table(name: "Present", image: "calculator", action: {
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController( withIdentifier: "calculator") as! CalculatorViewController

            self.navigationController?.present(vc, animated: true, completion: nil)
            
        }))
        
        tables.append(   Table(name: "Show Calculator", image: "calculator", action: {
            
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController( withIdentifier: "calculator") as! CalculatorViewController

            self.navigationController?.showDetailViewController(vc, sender: self)
            
        }))
        
        tables.append(   Table(name: "Push Calculator", image: "calculator", action: {
            
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController( withIdentifier: "calculator") as! CalculatorViewController

            self.navigationController?.pushViewController(vc, animated: true)
            
        }))
        
        tables.append(   Table(name: "Calculator", image: "calculator", action: {
            
            self.navigationController?.popToRootViewController(animated: true)
            
        }))
        
    }
    
}



struct Table {
    
    var name: String
    var image: String
    var action: () -> Void
    
}








extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tables.count
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UserTableViewCell
        
        let data = tables[indexPath.row]
        
        cell.configure(firstName: data.name,
                       avatar: data.image)
        
        cell.separatorInset = UIEdgeInsets(top: 0, left: UIScreen.main.bounds.width, bottom: 0, right: 0)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tables[indexPath.row].action()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
}

