//
//  CalculatorViewController.swift
//  NavigationZone
//
//  Created by Hitarth Bhatt on 21/07/21.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    let id: String = "cell"
    
    var previousValue: Int = 0
    var newValue: Int = 0
    var secondValue: Int = 0
    var actionType: actions = .none
    
    
    var model: [ButtonOptions] = [ButtonOptions]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let nib = UINib(nibName: "ButtonCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: id)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        label.text = String(previousValue)
        
        setup()
        
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        print(size.width)
        collectionView.reloadData()
    }
    
    
    func setup() {
        
        model.append(.advanceButton(model: AdvanceButton(name: "AC", action: {
            
        })))
        
        model.append(.advanceButton(model: AdvanceButton(name: "+/-", action: {
            
        })))
        
        model.append(.advanceButton(model: AdvanceButton(name: "%", action: {
            
        })))
        
        model.append(.actionButton(model: ActionButton(name: "/", action: {
            self.showActions(val: "/")
            self.actionType = .divide
        })))
        
        
        model.append(.numberButton(model: NumberButton(name: "7", action: {
            self.showValue(val: 7)
        })))
        model.append(.numberButton(model: NumberButton(name: "8", action: {
            self.showValue(val: 8)
        })))
        model.append(.numberButton(model: NumberButton(name: "9", action: {
            self.showValue(val: 9)
        })))
        
        model.append(.actionButton(model: ActionButton(name: "*", action: {
            self.showActions(val: "*")
            self.actionType = .multi
        })))
        
        
        model.append(.numberButton(model: NumberButton(name: "6", action: {
            self.showValue(val: 6)
        })))
        model.append(.numberButton(model: NumberButton(name: "5", action: {
            self.showValue(val: 5)
        })))
        model.append(.numberButton(model: NumberButton(name: "4", action: {
            self.showValue(val: 4)
        })))
        
        model.append(.actionButton(model: ActionButton(name: "-", action: {
            self.showActions(val: "-")
            self.actionType = .sub
        })))
        
        
        model.append(.numberButton(model: NumberButton(name: "3", action: {
            self.showValue(val: 3)
        })))
        model.append(.numberButton(model: NumberButton(name: "2", action: {
            self.showValue(val: 2)
        })))
        model.append(.numberButton(model: NumberButton(name: "1", action: {
            self.showValue(val: 1)
        })))
        
        model.append(.actionButton(model: ActionButton(name: "+", action: {
            self.showActions(val: "+")
            self.actionType = .add
        })))
        
        
        model.append(.numberButton(model: NumberButton(name: "0", action: {
            self.showValue(val: 0)
        })))
        model.append(.numberButton(model: NumberButton(name: ".", action: {
            
        })))
        
        model.append(.actionButton(model: ActionButton(name: "=", action: {
            self.showResult()
        })))
        
    }
    
    
    enum actions {
        
        case none, add, sub, multi, divide
        
    }
    

    
    
    func performAction(newVal: Int) {
        
        switch actionType {
        case .none:
            return
        case .add:
            previousValue = previousValue + newVal
        case .sub:
            previousValue = previousValue - newVal
        case .multi:
            previousValue = previousValue * newVal
        case .divide:
            previousValue = previousValue / newVal
        }
        
    }
    
    
    
    func showResult() {
        
        if actionType != .none {
            self.performAction(newVal: secondValue)
        }
        
        self.label.text = String(previousValue)
        
        
    }
    
    
    func showActions(val: String) {
        
        self.label.text = val
        
    }
    
    
    func showValue(val: Int) {
        
        if actionType == .none {
            self.newValue = val
        }else {
            self.secondValue = val
        }
        
        self.label.text = String(val)
    }
    
    
    
}


extension CalculatorViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 19
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: id, for: indexPath) as! ButtonCollectionViewCell
        
        let model = model[indexPath.row]
        
        switch model.self {
            
        case .advanceButton(let model):
            
            cell.configure(name: model.name, color: .lightGray)
            
        case .numberButton(let model):
            
            cell.configure(name: model.name, color: .systemBlue)
            
        case .actionButton(let model):
            
            cell.configure(name: model.name, color: .orange)
            
        }
        
        
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
//        let width = UIScreen.main.bounds.width
        let width = collectionView.frame.size.width
        let height = collectionView.frame.size.height
        
        switch model[indexPath.row].self {
            
        case .numberButton(let model):
            
            
            if model.name == "0" {
                return CGSize(width: (width - 6)/2, height: (height)/5.5)
            }
            return CGSize(width: (width - 6)/4, height: (height)/5.5)
            
        default:
            return CGSize(width: (width - 6)/4, height: (height)/5.5)
        
        }
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch model[indexPath.row].self {
            
        case .numberButton(let model):
            model.action()
            
        case .advanceButton(let model):
            model.action()
            
        case .actionButton(let model):
            model.action()
            
        }
        
    }
    
    
    
}
