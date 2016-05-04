//
//  MRTViewController.swift
//  MRTStation
//
//  Created by Chun Tie Lin on 2016/5/2.
//  Copyright © 2016年 ChunTaiLin. All rights reserved.
//

import UIKit

class MRTViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    var mrtStationArray = [mrtStationCollection]()
    var stationDictionary = [String:[String]]()
    var stationName = [String]()
    var lineNumber = [[String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mrtStationArray = MRTStationData().getJSON()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return mrtStationArray.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mrtStationArray[section].stations.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return mrtStationArray[section].lineName
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MRTCell") as! MRTTableViewCell
        
        stationDictionary = mrtStationArray[indexPath.section].stations
        stationName = stationDictionary.map { (x:(String, [String])) -> String in
            return x.0
        }
        lineNumber = stationDictionary.map { (x:(String, [String])) -> [String] in
            return x.1
        }
        
        let stationLineCount = lineNumber[indexPath.row].count
        
        cell.stationNameLabel.text = stationName[indexPath.row]
        
        if stationLineCount == 1 {            
            cell.stationLineLabel1.text = lineNumber[indexPath.row][0]
            cell.stationLineLabel1.textColor = UIColor.whiteColor()
            cell.stationLineLabel1.backgroundColor = MRTStationData().getBackgroundColor(lineNumber[indexPath.row][0])
            cell.stationLineLabel1.clipsToBounds = true
            cell.stationLineLabel1.layer.cornerRadius = 10
            
            cell.stationLineLabel2.textColor = UIColor.whiteColor()
            cell.stationLineLabel2.clipsToBounds = true
            cell.stationLineLabel2.layer.cornerRadius = 10
            cell.stationLineLabel2.hidden = true
        } else {
            cell.stationLineLabel1.text = lineNumber[indexPath.row][0]
            cell.stationLineLabel1.textColor = UIColor.whiteColor()
            cell.stationLineLabel1.backgroundColor = MRTStationData().getBackgroundColor(lineNumber[indexPath.row][0])
            cell.stationLineLabel1.clipsToBounds = true
            cell.stationLineLabel1.layer.cornerRadius = 10
            
            cell.stationLineLabel2.text = lineNumber[indexPath.row][1]
            cell.stationLineLabel2.textColor = UIColor.whiteColor()
            cell.stationLineLabel2.backgroundColor = MRTStationData().getBackgroundColor(lineNumber[indexPath.row][1])
            cell.stationLineLabel2.clipsToBounds = true
            cell.stationLineLabel2.layer.cornerRadius = 10
            cell.stationLineLabel2.hidden = false
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let index = tableView.indexPathForSelectedRow
        let cell = tableView.cellForRowAtIndexPath(index!) as! MRTTableViewCell
        let stationLineCount = lineNumber[indexPath.row].count
        
        if stationLineCount == 1 {
            self.performSegueWithIdentifier("OneLine", sender: self)
        } else {
            self.performSegueWithIdentifier("TwoLine", sender: self)
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let index = tableView.indexPathForSelectedRow
        let cell = tableView.cellForRowAtIndexPath(index!) as! MRTTableViewCell        
        
        if segue.identifier == "OneLine" {
            var destinationVC = segue.destinationViewController as! OneLineViewController
            let lineNameArray = MRTStationData().getLineName(cell.stationNameLabel.text!)
            
            destinationVC.acceptName = cell.stationNameLabel.text!
            destinationVC.acceptNumber = lineNameArray[0]
        } else if segue.identifier == "TwoLine" {
            var destinationVC = segue.destinationViewController as! TwoLinesViewController
            let lineNameArray = MRTStationData().getLineName(cell.stationNameLabel.text!)
            
            destinationVC.acceptName = cell.stationNameLabel.text!
            destinationVC.acceptNumber1 = lineNameArray[0]
            destinationVC.acceptNumber2 = lineNameArray[1]
        }
    }
}
