//
//  ColorListTableViewCell.swift
//  MatchPoint0
//
//  Created by Yu Sum Yung on 21/11/2021.
//

import UIKit

class ColorListTableViewCell: UITableViewCell {

    @IBOutlet weak var colorName: UILabel!
    @IBOutlet weak var color1: UIImageView!
    @IBOutlet weak var color2: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
