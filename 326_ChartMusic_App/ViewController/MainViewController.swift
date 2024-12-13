//
//  ViewController.swift
//  labTest_musicChartApp_326
//
//  Created by xCressselia on 17/11/2567 BE.
//

import UIKit
import WebKit

class MainViewController: UIViewController, WKUIDelegate {
    var song: String = ""
    var singer: String = ""
    var webURL: String = ""
    var row: Int = 0
    var webWiki: String = ""
    var index: Int = 0
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imgBlur: UIVisualEffectView!
    @IBOutlet weak var imgCard: UIView!
    @IBOutlet weak var imgBG: UIImageView!
    @IBOutlet weak var lbSong: UILabel!
    @IBOutlet weak var lbArtist: UILabel!
    @IBOutlet weak var txtWebsite: UITextField!
    @IBOutlet weak var webView: WKWebView!
    
    @IBAction func btnSong(_ sender: UIButton) {
    }
    
    @IBAction func btnMap(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let myURL = URL(string: webWiki) {
            let myRequest = URLRequest(url: myURL)
            webView.load(myRequest)
        } else {
            print("Invalid URL")
        }
        
        lbSong.text = song
        lbArtist.text = singer
        txtWebsite.text = webURL
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "locationSegue",
           let mapVC = segue.destination as? MapViewController {
            mapVC.locationIndex = index
        }
        
        if segue.identifier == "songSegue",
           let songVC = segue.destination as? SongViewController {
            songVC.currentSongName = song
            songVC.index = index

        }
    }
}


