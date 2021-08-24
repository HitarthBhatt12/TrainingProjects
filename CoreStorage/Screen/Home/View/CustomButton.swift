//
//  CustomButton.swift
//  CoreStorage
//
//  Created by Hitarth Bhatt on 03/08/21.
//

import UIKit

@IBDesignable class CustomButton: UIButton {

    @IBInspectable
    var cornerRadius: CGFloat = 20 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
        
}
