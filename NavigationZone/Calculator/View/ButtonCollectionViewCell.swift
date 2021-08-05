//
//  ButtonCollectionViewCell.swift
//  Calculator
//
//  Created by Hitarth Bhatt on 16/07/21.
//

import UIKit

class ButtonCollectionViewCell: UICollectionViewCell {

   
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(name: String, color: UIColor) {
        
        self.label.text = name
        self.view.backgroundColor = color
        
        self.layer.cornerRadius = 10
        
        
    }
    

}
