//
//  VideoCell.swift
//  Learn2Dance
//
//  Created by William Hutt on 4/28/19.
//  Copyright © 2019 William Hutt. All rights reserved.
//

import UIKit
import WebKit
class VideoCell: UITableViewCell {

    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var embeddedView: WKWebView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
