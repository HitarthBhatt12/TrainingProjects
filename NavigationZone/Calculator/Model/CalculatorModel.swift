//
//  CalculatorModel.swift
//  Calculator
//
//  Created by Hitarth Bhatt on 16/07/21.
//

import Foundation


enum ButtonOptions {
    case advanceButton(model: AdvanceButton)
    case numberButton(model: NumberButton)
    case actionButton(model: ActionButton)
}



struct AdvanceButton {
    
    let name: String
    let action: (() -> Void)
    
}

struct NumberButton {
    
    let name: String
    let action: (() -> Void)
    
}

struct ActionButton {
    
    let name: String
    let action: (() -> Void)
    
}
