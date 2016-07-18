//
//  SortCell.swift
//  Yelp
//
//  Created by Thang Nguyen on 7/17/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit
@objc protocol SortCellDelegate {
    optional func sortCell(sortCell: SortCell, didChangeValue value: Bool)
    
}
class SortCell: UITableViewCell {
    var delegate:SortCellDelegate?

    @IBOutlet weak var sortLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
