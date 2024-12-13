//
//  songList.swift
//  326_ChartMusic_App
//
//  Created by xCressselia on 19/11/2567 BE.
//

import UIKit

class songList: NSObject {
    var lastSong: [String] = [String]()
    var famousSong: [String] = [String]()
    
    func loadPlist(fname:String) {
        if let url = Bundle.main.url(forResource: fname, withExtension: "plist") {
            let data = try! Data(contentsOf: url)
            let plist = try! PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [String:Any]
            lastSong = (plist?["LastSong"] as? [String])!
            famousSong = (plist?["FamousSong"] as? [String])!
        }
    }
}
