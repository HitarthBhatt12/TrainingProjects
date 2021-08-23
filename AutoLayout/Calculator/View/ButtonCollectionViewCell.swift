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
        self.label.textColor = color
        self.label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        self.view.backgroundColor = UIColor(white: 0.05, alpha: 1)
    }
}
