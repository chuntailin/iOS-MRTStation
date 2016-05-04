//
//  MRTTableViewCell.swift
//  MRTStation
//
//  Created by Chun Tie Lin on 2016/5/2.
//  Copyright © 2016年 ChunTaiLin. All rights reserved.
//

import UIKit

class MRTTableViewCell: UITableViewCell {

    @IBOutlet weak var stationNameLabel: UILabel!
    @IBOutlet weak var stationLineLabel1: UILabel!
    @IBOutlet weak var stationLineLabel2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
