//
//  deathNoteTableViewCell.swift
//  d02
//
//  Created by Malebo MTHOMBENI on 2018/10/04.
//  Copyright © 2018 Malebo MTHOMBENI. All rights reserved.
//

import UIKit

class deathNoteTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var noteLabel: UILabel!
    
    var deathNote: (String, String, String)? {
        didSet{
            if let dn = deathNote{
                nameLabel?.text = dn.0
                dateLabel?.text = dn.1
                noteLabel?.text = dn.2
                
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
