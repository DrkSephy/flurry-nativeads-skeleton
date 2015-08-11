//
//  TblCell.swift
//  streamtest
//
//  Created by David Leonard on 8/11/15.
//  Copyright (c) 2015 Yahoo. All rights reserved.
//

import UIKit

class TblCell: UITableViewCell {

    @IBOutlet weak var streamTitleLabel: UILabel!
    @IBOutlet weak var streamDescriptionLabel: UILabel!
    @IBOutlet weak var streamImageView: UIImageView!
    @IBOutlet weak var sponsoredImageView: UIImageView!
    @IBOutlet weak var streamSourceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
