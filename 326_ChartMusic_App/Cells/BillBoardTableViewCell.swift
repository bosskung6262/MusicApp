//
//  BillBoardTableViewCell.swift
//  labTest_musicChartApp_326
//
//  Created by xCressselia on 17/11/2567 BE.
//

import UIKit

class BillBoardTableViewCell: UITableViewCell {

    @IBOutlet weak var lbArtist: UILabel!
    @IBOutlet weak var lbSong: UILabel!
    @IBOutlet weak var lbRank: UILabel!
    @IBOutlet weak var imgSong: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
