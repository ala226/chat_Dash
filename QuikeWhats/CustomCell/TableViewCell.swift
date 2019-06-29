//
//  TableViewCell.swift
//  QuikeWhats
//
//  Created by Eng.lolla on 5/15/19.
//  Copyright © 2019 Eng.lolla. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var msg: UILabel!
    @IBOutlet weak var name: UILabel!
    
    
    

    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        userImage.layer.cornerRadius = userImage.frame.size.width/2
    }
    
    
}
