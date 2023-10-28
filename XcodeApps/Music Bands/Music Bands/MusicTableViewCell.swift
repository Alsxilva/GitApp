//
//  MusicTableViewCell.swift
//  Music Bands
//
//  Created by Diplomado on 28/10/23.
//

import UIKit

class MusicTableViewCell: UITableViewCell {
    
    @IBOutlet weak var BandName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
}
