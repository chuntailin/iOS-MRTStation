//
//  TwoLinesViewController.swift
//  MRTStation
//
//  Created by Chun Tie Lin on 2016/5/3.
//  Copyright © 2016年 ChunTaiLin. All rights reserved.
//

import UIKit

class TwoLinesViewController: UIViewController {

    @IBOutlet weak var stationNameLabel: UILabel!
    @IBOutlet weak var lineNumberLabel1: UILabel!
    @IBOutlet weak var lineNumberLabel2: UILabel!
    
    var acceptName: String!
    var acceptNumber1: String!
    var acceptNumber2: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = acceptName
        
        self.stationNameLabel.text = acceptName
        self.lineNumberLabel1.text = acceptNumber1
        self.lineNumberLabel2.text = acceptNumber2
        
        self.lineNumberLabel1.textColor = UIColor.whiteColor()
        self.lineNumberLabel1.backgroundColor = MRTStationData().getColor(acceptNumber1)
        
        self.lineNumberLabel2.textColor = UIColor.whiteColor()
        self.lineNumberLabel2.backgroundColor = MRTStationData().getColor(acceptNumber2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
