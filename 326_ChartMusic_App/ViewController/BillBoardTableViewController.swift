//
//  BillBoardTableViewController.swift
//  labTest_musicChartApp_326
//
//  Created by xCressselia on 17/11/2567 BE.
//

import UIKit

class BillBoardTableViewController: UITableViewController {
        
    var songName: [String] = [String]()
    var artistName: [String] = [String]()
    var ranks: [String] = [String]()
    var songImg: [String] = [String]()
    var lastSong: [String] = [String]()
    var famousSong: [String] = [String]()
    var webURL: [String] = [String]()
    var webHistory: [String] = [String]()
    var row:Int = 0
    var loadPlist = Loading()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 170
        setupData()
        
    }
    private func setupData() {
        songName = [
            "A Bar Song (Tipsy)",
            "Die With A Smile",
            "Birds Of A Feather",
            "Espresso",
            "Lose Control",
            "I Had Some Help",
            "Taste",
            "Beautiful Things",
            "Love Somebody",
            "Sticky"
        ]
        
        artistName = [
            "Shaboozey",
            "Lady Gaga & Bruno Mars",
            "Billie Eilish",
            "Sabrina Carpenter",
            "Teddy Swims",
            "Post Malone Featuring Morgan Wallen",
            "Sabrina Carpenter",
            "Benson Boone",
            "Morgan Wallen",
            "Tyler, The Creator Featuring GloRilla, SexyyRed & Lil Wayne"
        ]
        
        ranks = [
            "Top 1", "Top 2", "Top 3", "Top 4",
            "Top 5", "Top 6", "Top 7",
            "Top 8", "Top 9", "Top 10"
        ]
        
        songImg = [
            "A Bar Song (Tipsy).jpg",
            "Die With A Smile.jpg",
            "Birds Of A Feather.jpg",
            "Espresso.jpg",
            "Lose Control.jpg",
            "I Had Some Help.jpg",
            "Taste.jpg",
            "Beautiful Things.jpg",
            "Love Somebody.jpg",
            "Sticky.jpg"
        ]
        
        famousSong = [
            "A Bar Song (Tipsy)",
            "Uptown Funk",
            "bad guy",
            "Nonsense",
            "Lose Control",
            "Wow.",
            "Nonsense",
            "Ghost Town",
            "Wasted On You",
            "WUSYANAME"
        ]
        
        webURL = [
            "https://shaboozeymerch.com/",
            "https://www.brunomars.com/",
            "https://store.billieeilish.com/",
            "https://www.sabrinacarpenter.com/",
            "https://www.teddyswims.com/",
            "https://www.postmalone.com/",
            "https://www.sabrinacarpenter.com/",
            "https://www.bensonboone.com/",
            "https://morganwallen.com/",
            "https://x.com/tylerthecreator"
        ]
        
        webHistory = [
            "https://en.wikipedia.org/wiki/Shaboozey",
            "https://en.wikipedia.org/wiki/Bruno_Mars",
            "https://en.wikipedia.org/wiki/Billie_Eilish",
            "https://en.wikipedia.org/wiki/Sabrina_Carpenter",
            "https://en.wikipedia.org/wiki/Teddy_Swims",
            "https://en.wikipedia.org/wiki/Post_Malone",
            "https://en.wikipedia.org/wiki/Sabrina_Carpenter",
            "https://en.wikipedia.org/wiki/Benson_Boone",
            "https://en.wikipedia.org/wiki/Morgan_Wallen",
            "https://en.wikipedia.org/wiki/Tyler,_the_Creator"
        ]
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songName.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "billboardCell", for: indexPath) as! BillBoardTableViewCell
       
        cell.lbRank.text = ranks[indexPath.row]
        cell.lbSong.text = songName[indexPath.row]
        cell.lbArtist.text = artistName[indexPath.row]
        cell.imgSong.image = UIImage(named: songImg[indexPath.row])
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "chooseSongInfo" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationVC = segue.destination as! MainViewController
                destinationVC.song = songName[indexPath.row]
                destinationVC.singer = artistName[indexPath.row]
                destinationVC.webURL = webURL[indexPath.row]
                destinationVC.webWiki = webHistory[indexPath.row]
                destinationVC.index = indexPath.row
            }
        }

        }
    }
