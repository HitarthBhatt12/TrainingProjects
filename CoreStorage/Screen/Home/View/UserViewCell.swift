//
//  CharacterViewCell.swift
//  MVVM
//
//  Created by Hitarth Bhatt on 30/07/21.
//

import UIKit
import SDWebImage

class UserViewCell: UITableViewCell {

    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var heading: UILabel!
    @IBOutlet weak var articleDescription: UILabel!
    @IBOutlet weak var authorName: UILabel!
    @IBOutlet weak var cardView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.characterImage.layer.cornerRadius = 10
        self.characterImage.contentMode = .scaleToFill
        self.cardView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.heading.text = nil
        self.articleDescription.text = nil
        self.authorName.text = nil
        self.characterImage.image = nil
    }
    
    func configure(title: String, desc: String, image: Data, authorName: String) {
        self.heading.text = title
        self.articleDescription.text = desc
        self.authorName.text = authorName
        
        self.characterImage.image = UIImage(data: image)
    }
    
}
