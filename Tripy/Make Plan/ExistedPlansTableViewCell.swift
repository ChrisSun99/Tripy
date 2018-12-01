//
//  ExistedPlansTableViewCell.swift
//  Tripy
//
//  Created by Chris  on 11/28/18.
//  Copyright © 2018 Chris . All rights reserved.
//

import UIKit

class ExistedPlansTableViewCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var TripImage: UIImageView!
    @IBOutlet weak var TripTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
