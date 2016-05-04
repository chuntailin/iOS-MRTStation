//
//  OneLineViewController.swift
//  MRTStation
//
//  Created by Chun Tie Lin on 2016/5/3.
//  Copyright © 2016年 ChunTaiLin. All rights reserved.
//

import UIKit

class OneLineViewController: UIViewController {

    @IBOutlet weak var stationNameLabel: UILabel!
    @IBOutlet weak var lineNumberLabel: UILabel!
    
    var acceptName: String!
    var acceptNumber: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = acceptName

        self.stationNameLabel.text = acceptName
        self.lineNumberLabel.text = acceptNumber
        
        self.lineNumberLabel.textColor = UIColor.whiteColor()
        self.lineNumberLabel.backgroundColor = MRTStationData().getColor(acceptNumber)
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
