//
//  MRTStationData.swift
//  MRTStation
//
//  Created by Chun Tie Lin on 2016/5/2.
//  Copyright © 2016年 ChunTaiLin. All rights reserved.
//

import Foundation
import SwiftyJSON


struct mrtStationCollection {
   
    var lineName: String
    var stations: [String:[String]]
    
    init(lineName: String, stations: [String:[String]]) {
        self.lineName = lineName
        self.stations = stations
    }
}


class MRTStationData {
    
    func getJSON () -> [mrtStationCollection] {
        
        let path = NSBundle.mainBundle().pathForResource( "MRT", ofType: "json")
        let data = NSData(contentsOfFile: path!)
        let json = JSON(data: data!)
        
        var wenhuDictionary = [String:[String]]()
        var xinyiDictionary = [String:[String]]()
        var beitoDictionary = [String:[String]]()
        var xindianDictionary = [String:[String]]()
        var bitanDictionary = [String:[String]]()
        var xinluDictionary = [String:[String]]()
        var bennanDictionary = [String:[String]]()
        var moukunDictionary = [String:[String]]()
        
        
        for i in 0...json.count {
            
            let stationName = json[i]["name"].stringValue
            let line = json[i]["lines"].dictionaryValue.map({ (x: (String, JSON)) -> String in
                return x.0
            })
            let lineNumber = json[i]["lines"].dictionaryValue.map({ (x: (String, JSON)) -> String in
                return x.1.stringValue
            })
            
            if line.contains("文湖線") {
                wenhuDictionary[ String(stationName)] = lineNumber
            }
            
            if line.contains("淡水信義線") {
                xinyiDictionary[String(stationName)] = lineNumber
            }
            
            if line.contains("新北投支線") {
                beitoDictionary[String(stationName)] = lineNumber
            }
            
            if line.contains("松山新店線") {
                xindianDictionary[String(stationName)] = lineNumber
            }
            
            if line.contains("小碧潭支線") {
                bitanDictionary[String(stationName)] = lineNumber
            }
            
            if line.contains("中和新蘆線") {
                xinluDictionary[String(stationName)] = lineNumber
            }
            
            if line.contains("板南線") {
                bennanDictionary[String(stationName)] = lineNumber
            }
            
            if line.contains("貓空纜車") {
                moukunDictionary[String(stationName)] = lineNumber
            }
        }
        
        let wenhu = mrtStationCollection(lineName: "文湖線", stations: wenhuDictionary)
        let xinyi = mrtStationCollection(lineName: "淡水信義線", stations: xinyiDictionary)
        let beito = mrtStationCollection(lineName: "新北投支線", stations: beitoDictionary)
        let xindian = mrtStationCollection(lineName: "松山新店線", stations: xindianDictionary)
        let bitan = mrtStationCollection(lineName: "小碧潭支線", stations: bitanDictionary)
        let xinlu = mrtStationCollection(lineName: "中和新蘆線", stations: xinluDictionary)
        let bennan = mrtStationCollection(lineName: "板南線", stations: bennanDictionary)
        let moukun = mrtStationCollection(lineName: "貓空纜車", stations: moukunDictionary)
        
        var mrtStationArray = [mrtStationCollection]()
        
        mrtStationArray.append(wenhu)
        mrtStationArray.append(xinyi)
        mrtStationArray.append(beito)
        mrtStationArray.append(xindian)
        mrtStationArray.append(bitan)
        mrtStationArray.append(xinlu)
        mrtStationArray.append(bennan)
        mrtStationArray.append(moukun)
        
        return mrtStationArray
    }
    
    func getBackgroundColor(lineName: String) -> UIColor {
        
        if lineName.containsString("BR") {
            return UIColor(red: 158/255, green: 101/255, blue: 46/255, alpha: 1)
        } else if lineName.containsString("BL") {
            return UIColor(red: 0/255, green: 94/255, blue: 184/255, alpha: 1)
        } else if lineName.containsString("G") && !lineName.containsString("M") && !lineName.containsString("A"){
            return UIColor(red: 0/255, green: 119/255, blue: 73/255, alpha: 1)
        } else if lineName.containsString("R") && !lineName.containsString("A") {
            return UIColor(red: 203/255, green: 44/255, blue: 48/255, alpha: 1)
        } else if lineName.containsString("MG") {
            return UIColor(red: 119/255, green: 185/255, blue: 51/255, alpha: 1)
        } else if lineName.containsString("O") {
            return UIColor(red: 255/255, green: 163/255, blue: 0/255, alpha: 1)
        } else if lineName.containsString("R") && lineName.containsString("A") {
            return UIColor(red: 248/255, green: 144/255, blue: 165/255, alpha: 1)
        } else {
            return UIColor(red: 205/255, green: 220/255, blue: 0/255, alpha: 1)
        }
    }
    
    func getLineName(stationName: String) -> [String] {
        
        let path = NSBundle.mainBundle().pathForResource( "MRT", ofType: "json")
        let data = NSData(contentsOfFile: path!)
        let json = JSON(data: data!)
        
        var wenhuArray = [String]()
        var xinyiArray = [String]()
        var beitoArray = [String]()
        var xindianArray = [String]()
        var bitanArray = [String]()
        var xinluArray = [String]()
        var bennanArray = [String]()
        var moukunArray = [String]()
    
        for i in 0...json.count {
            
            let stationName = json[i]["name"].stringValue
            let line = json[i]["lines"].dictionaryValue.map({ (x: (String, JSON)) -> String in
                return x.0
            })
            
            if line.contains("文湖線") {
                wenhuArray.append(stationName)
            }
            
            if line.contains("淡水信義線") {
                xinyiArray.append(stationName)
            }
            
            if line.contains("新北投支線") {
                beitoArray.append(stationName)
            }
            
            if line.contains("松山新店線") {
                xindianArray.append(stationName)
            }
            
            if line.contains("小碧潭支線") {
                bitanArray.append(stationName)
            }
            
            if line.contains("中和新蘆線") {
                xinluArray.append(stationName)
            }
            
            if line.contains("板南線") {
                bennanArray.append(stationName)
            }
            
            if line.contains("貓空纜車") {
                moukunArray.append(stationName)
            }
        }

        var lineNameArray = [String]()
        
        if wenhuArray.contains(stationName) {
            lineNameArray.append("文湖線")
        }
        
        if xinyiArray.contains(stationName) {
            lineNameArray.append("淡水信義線")
        }
        
        if beitoArray.contains(stationName) {
            lineNameArray.append("新北投支線")
        }
        
        if xindianArray.contains(stationName) {
            lineNameArray.append("松山新店線")
        }
        
        if bitanArray.contains(stationName) {
            lineNameArray.append("小碧潭支線")
        }
        
        if xinluArray.contains(stationName) {
            lineNameArray.append("中和新蘆線")
        }
        
        if bennanArray.contains(stationName) {
            lineNameArray.append("板南線")
        }
        
        if moukunArray.contains(stationName) {
            lineNameArray.append("貓空纜車")
        }
        
        return lineNameArray
    }

    func getColor(lineName: String) -> UIColor {
        
        if lineName.containsString("文湖") {
            return UIColor(red: 158/255, green: 101/255, blue: 46/255, alpha: 1)
        } else if lineName.containsString("板南") {
            return UIColor(red: 0/255, green: 94/255, blue: 184/255, alpha: 1)
        } else if lineName.containsString("松山新店") {
            return UIColor(red: 0/255, green: 119/255, blue: 73/255, alpha: 1)
        } else if lineName.containsString("淡水信義") {
            return UIColor(red: 203/255, green: 44/255, blue: 48/255, alpha: 1)
        } else if lineName.containsString("貓空") {
            return UIColor(red: 119/255, green: 185/255, blue: 51/255, alpha: 1)
        } else if lineName.containsString("中和新蘆") {
            return UIColor(red: 255/255, green: 163/255, blue: 0/255, alpha: 1)
        } else if lineName.containsString("新北投") {
            return UIColor(red: 248/255, green: 144/255, blue: 165/255, alpha: 1)
        } else {
            return UIColor(red: 205/255, green: 220/255, blue: 0/255, alpha: 1)
        }

    }
}