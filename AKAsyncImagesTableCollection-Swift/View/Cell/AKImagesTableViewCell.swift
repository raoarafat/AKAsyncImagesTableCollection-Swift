//
//  AKImagesTableViewCell.swift
//  AKAsyncImagesTableCollection
//
//  Created by Arafat on 6/23/15.
//  Copyright (c) 2015 Arafat Khan. All rights reserved.
//

import UIKit

class AKImagesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
