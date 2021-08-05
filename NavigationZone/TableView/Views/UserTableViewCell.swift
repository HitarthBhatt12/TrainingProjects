//
//  UserTableViewCell.swift
//  APICaller
//
//  Created by Hitarth Bhatt on 19/07/21.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var view: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func configure(firstName: String, avatar: String) {
        
        nameLabel.text = firstName
        view.layer.cornerRadius = 10
        userImage.layer.cornerRadius = 25
        userImage.image = UIImage(systemName: "opticaldisc")
    }
    
    
}
