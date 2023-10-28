//
//  My2ndTableViewCell.swift
//  Tablas
//
//  Created by Diplomado on 27/10/23.
//

import UIKit

class My2ndTableViewCell: UITableViewCell {
    
    @IBOutlet weak var MyTitle: UILabel!
    
    @IBOutlet weak var MySubtitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
