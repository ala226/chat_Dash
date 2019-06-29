//
//  TableViewCell2.swift
//  QuikeWhats
//
//  Created by Eng.lolla on 5/19/19.
//  Copyright © 2019 Eng.lolla. All rights reserved.
//

import UIKit

class TableViewCell2: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var img2: UIImageView!
    
    @IBOutlet weak var msg: UILabel!
    
    @IBOutlet weak var composeView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        img2.layer.cornerRadius = img2.frame.size.width/2
      composeView.layer.cornerRadius = 20
    }
    

}
