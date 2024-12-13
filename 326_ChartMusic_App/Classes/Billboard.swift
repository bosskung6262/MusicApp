//
//  Billboard.swift
//  labTest_musicChartApp_326
//
//  Created by xCressselia on 17/11/2567 BE.
//

import UIKit

class BillboardChart {
    var songName: String
    var artistName: String
    var rankPosition: String
    var songPics: String
    
    init(song: String, artist: String, rank: String, img: String) {
        self.songName = song
        self.artistName = artist
        self.rankPosition = rank
        self.songPics = img
    }
    
    init() {
        self.songName = ""
        self.artistName = ""
        self.rankPosition = ""
        self.songPics = ""
    }
    
    let bbInfo = [
        BillboardChart(
            song: "A Bar Song (Tipsy)",
            artist: "Shaboozey",
            rank: "Top 1",
            img: "A Bar Song (Tipsy).jpg"
        ),
        BillboardChart(
            song: "Die With A Smile",
            artist: "Lady Gaga & Bruno Mars",
            rank: "Top 2",
            img: "Die With A Smile.jpg"
        ),
        BillboardChart(
            song: "Birds Of A Feather",
            artist: "Billie Eilish",
            rank: "Top 3",
            img: "Birds Of A Feather.jpg"
        ),
        BillboardChart(
            song: "Espresso",
            artist: "Sabrina Carpenter",
            rank: "Top 4",
            img: "Espresso.jpg"
        ),
        BillboardChart(
            song: "Lose Control",
            artist: "Teddy Swims",
            rank: "Top 5",
            img: "Lose Control.jpg"
        ),
        BillboardChart(
            song: "I Had Some Help",
            artist: "Post Malone Featuring Morgan Wallen",
            rank: "Top 6",
            img: "I Had Some Help.jpg"
        ),
        BillboardChart(
            song: "Taste",
            artist: "Sabrina Carpenter",
            rank: "Top 7",
            img: "Taste.jpg"
        ),
        BillboardChart(
            song: "Beautiful Things",
            artist: "Benson Boone",
            rank: "Top 8",
            img: "Beatufiul Things.jpg"
        ),
        BillboardChart(
            song: "Love Somebody",
            artist: "Morgan Wallen",
            rank: "Top 9",
            img: "Love Somebody.jpg"
        ),
        BillboardChart(
            song: "Sticky",
            artist: "Tyler, The Creator Featuring GloRilla, SexyyRed & Lil Wayne",
            rank: "Top 10",
            img: "Sticky.jpg"
        )
    ]
}
