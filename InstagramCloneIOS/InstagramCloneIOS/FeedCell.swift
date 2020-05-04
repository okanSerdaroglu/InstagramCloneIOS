//
//  FeedCell.swift
//  InstagramCloneIOS
//
//  Created by Okan Serdaroğlu on 4.05.2020.
//  Copyright © 2020 Okan Serdaroğlu. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {

    @IBOutlet weak var labelUserEmail: UILabel!
    
    @IBOutlet weak var imageViewUser: UIImageView!
    
    @IBOutlet weak var labelComment: UILabel!
    
    @IBOutlet weak var labelLike: UILabel!
    @IBAction func buttonLike(_ sender: Any) {
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
