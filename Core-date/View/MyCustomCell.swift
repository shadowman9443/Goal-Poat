//
//  MyCustomCell.swift
//  Core-date
//
//  Created by aunogarafat on 5/25/18.
//  Copyright © 2018 aunogarafat. All rights reserved.
//

import UIKit

class MyCustomCell: UITableViewCell {

    @IBOutlet weak var completionView: UIView!
    
    @IBOutlet weak var getupdating: UILabel!
    
    @IBOutlet weak var type: UILabel!
    
    @IBOutlet weak var desc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
