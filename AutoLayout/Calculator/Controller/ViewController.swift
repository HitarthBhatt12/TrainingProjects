//
//  ViewController.swift
//  AutoLayout
//
//  Created by Hitarth Bhatt on 27/07/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    let id: String = "cell"
    var previousValue: Int = 0
    var newValue: Int = 0
    var secondValue: Int = 0
    var actionType: Actions = .none
    var model: [ButtonOptions] = [ButtonOptions]()
    var extraModel: [ButtonOptions] = [ButtonOptions]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let nib = UINib(nibName: "ButtonCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: id)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionViewB.register(nib, forCellWithReuseIdentifier: id)
        collectionViewB.delegate = self
        collectionViewB.dataSource = self
        label.text = String(previousValue)
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            setupForIphone()
        case .pad:
            setupForIpad()
            setupForIphone()
        default:
            print("Dont know")
        }
    }
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewB: UICollectionView!
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        print(size.width)
        collectionView.reloadData()
    }
    func setupForIpad() {
        extraModel.append(.advanceButton(model: AdvanceButton(name: "(", action: {
        })))
        extraModel.append(.advanceButton(model: AdvanceButton(name: ")", action: {
        })))
        extraModel.append(.advanceButton(model: AdvanceButton(name: "shift", action: {
        })))
        extraModel.append(.actionButton(model: ActionButton(name: "m+", action: {
        })))
        extraModel.append(.numberButton(model: NumberButton(name: "sin", action: {
        })))
        extraModel.append(.numberButton(model: NumberButton(name: "cos", action: {
        })))
        extraModel.append(.numberButton(model: NumberButton(name: "tan", action: {
        })))
        extraModel.append(.actionButton(model: ActionButton(name: "10°", action: {
        })))
        extraModel.append(.numberButton(model: NumberButton(name: "SI", action: {
        })))
        extraModel.append(.numberButton(model: NumberButton(name: "CI", action: {
        })))
        extraModel.append(.numberButton(model: NumberButton(name: "IN", action: {
        })))
        extraModel.append(.actionButton(model: ActionButton(name: "log10", action: {
        })))
        extraModel.append(.numberButton(model: NumberButton(name: "sinh", action: {
        })))
        extraModel.append(.numberButton(model: NumberButton(name: "cosh", action: {
        })))
        extraModel.append(.numberButton(model: NumberButton(name: "tanh", action: {
        })))
        extraModel.append(.actionButton(model: ActionButton(name: "A™", action: {
        })))
        extraModel.append(.numberButton(model: NumberButton(name: "Rand", action: {
        })))
        extraModel.append(.numberButton(model: NumberButton(name: "e°", action: {
        })))
        extraModel.append(.actionButton(model: ActionButton(name: "1/x", action: {
        })))
    }
    func setupForIphone() {
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
    enum Actions {
        case none, add, sub, multi, divide
    }
    func performAction(newVal: Int) {
        switch actionType {
        case .none:
            return
        case .add:
            previousValue += newVal
        case .sub:
            previousValue -= newVal
        case .multi:
            previousValue *= newVal
        case .divide:
            previousValue /= newVal
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
        } else {
            self.secondValue = val
        }
        self.label.text = String(val)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.model.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: id, for: indexPath) as? ButtonCollectionViewCell else { return UICollectionViewCell() }
            let model = model[indexPath.row]
            switch model.self {
            case .advanceButton(let model):
                cell.configure(name: model.name, color: .blue)
            case .numberButton(let model):
                cell.configure(name: model.name, color: .white)
            case .actionButton(let model):
                cell.configure(name: model.name, color: .orange)
            }
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: id, for: indexPath) as? ButtonCollectionViewCell else { return UICollectionViewCell() }
            let extraModel = extraModel[indexPath.row]
            switch extraModel.self {
            case .advanceButton(let model):
                cell.configure(name: model.name, color: .blue)
            case .numberButton(let model):
                cell.configure(name: model.name, color: .white)
            case .actionButton(let model):
                cell.configure(name: model.name, color: .orange)
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let height = collectionView.bounds.height
        if collectionView == self.collectionView {
            switch model[indexPath.row].self {
            case .numberButton(let model):
                if model.name == "0" {
                    return CGSize(width: (width)/2, height: (height - 5)/5.5)
                }
                return CGSize(width: (width - 2)/4, height: (height - 5)/5.5)
            default:
                return CGSize(width: (width - 2)/4, height: (height - 5)/5.5)
            }
        } else {
            switch extraModel[indexPath.row].self {
            case .numberButton(let model):
                if model.name == "Rand" {
                    return CGSize(width: (width)/2, height: (height - 5)/5.5)
                }
                return CGSize(width: (width - 2)/4, height: (height - 5)/5.5)
            default:
                return CGSize(width: (width - 2)/4, height: (height - 5)/5.5)
            }
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
