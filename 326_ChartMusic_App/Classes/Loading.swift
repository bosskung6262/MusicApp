//
//  Loading.swift
//  labTest_musicChartApp_326
//
//  Created by xCressselia on 18/11/2567 BE.
//

import UIKit

class Loading: NSObject {

    func load(file:String) -> [String] {
        var Array:[String] = []
        
        let path = Bundle.main.url(forResource: file, withExtension: "plist")
        let testData = try? Data(contentsOf: path!)
        let myPlist = try? PropertyListSerialization.propertyList(from: testData!, options: [], format: nil)
        Array=myPlist as! [String]
        
        return Array
    }
}

