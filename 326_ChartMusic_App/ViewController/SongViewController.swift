import UIKit
import AVKit
import AVFoundation
import SwiftyGif

class SongViewController: UIViewController {
    
    @IBOutlet weak var btnStart: UIButton!
    @IBOutlet weak var imgGif: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var displayShow: UIView!
    @IBOutlet weak var segControl: UISegmentedControl!
    
    
    let loadPlist = Loading()
    var index: Int = 0
    var currentSongName: String = ""
    var player: AVPlayer?
    var playerLayer: AVPlayerLayer?
    var lastSongs=[String]()
    var famousSongs=[String]()
    var lastSong: [String] = [String]()
    var famousSong: [String] = [String]()
    var artistName: [String] = [String]()
    
    var currentSongs: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("song name:",currentSongName)
        print(index)
        
        takeData()
        
        playMV(songName: currentSongName)
        
        do {
            let gif = try UIImage(gifName: "music.gif")
            imgGif.setGifImage(gif, loopCount: -1)
        } catch {
            print("Error loading GIF: eRRoR!!!!")
        }
        
    }
    
    func takeData() {
        if let path = Bundle.main.path(forResource: "songsList", ofType: "plist"),
           let plistData = NSDictionary(contentsOfFile: path) as? [String: Any] {
            
            // Load songs into arrays
            lastSong = plistData["LastSong"] as? [String] ?? []
            famousSong = plistData["FamousSong"] as? [String] ?? []
            
            print("Last Songs:", lastSong)
            print("Famous Songs:", famousSong)
        } else {
            print("Failed to load plist data")
        }
    }

    
    @IBAction func segControlChanged(_ sender: UISegmentedControl) {
        let selectedIndex = sender.selectedSegmentIndex
        
        currentSongs = (selectedIndex == 0) ? lastSong : famousSong
        
        if currentSongs.indices.contains(index) {
            let songToPlay = currentSongs[index]
            lbName.text = songToPlay
            currentSongName = songToPlay
            playMV(songName: currentSongName)
        } else {
            lbName.text = "No songs available"
            currentSongName = ""
            print("No songs available in the selected category")
        }
    }


    
    @IBAction func btnStart(_ sender: UIButton) {
        if imgGif.isAnimatingGif() {
            imgGif.stopAnimatingGif()
            sender.setTitle("Play", for: .normal)
        } else {
            imgGif.startAnimatingGif()
            sender.setTitle("Stop", for: .normal)
        }
    }
    
    @IBAction func btnPlay(_ sender: Any) {
        if !currentSongName.isEmpty {
            player?.play()
        }
    }
    
    @IBAction func btnPause(_ sender: Any) {
        if let player = player, player.rate != 0 {
            player.pause()
        } else {
            player?.play()
        }
    }
    
    @IBAction func btnStop(_ sender: Any) {
        player?.pause()
        player?.seek(to: CMTime.zero)
    }
    
    func playMV(songName: String) {
        let fullSongName = "\(songName).mp4"
        print("Song:",fullSongName)
        
        if let path = Bundle.main.path(forResource: songName, ofType: "mp4") {
            let url = URL(fileURLWithPath: path)
            player = AVPlayer(url: url)
            
            playerLayer?.removeFromSuperlayer()
            
            playerLayer = AVPlayerLayer(player: player)
            playerLayer?.frame = displayShow.bounds
            playerLayer?.videoGravity = .resizeAspectFill
            
            displayShow.layer.addSublayer(playerLayer!)
            
            player?.play()
            
            lbName.text = songName
            currentSongName = songName
            
        } else {
            print("ไม่พบไฟล์วิดีโอ: \(fullSongName)")
        }
    }
}
