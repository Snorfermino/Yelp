//
//  DealCell.swift
//  Yelp
//
//  Created by Thang Nguyen on 7/17/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit
@objc protocol DealCellDelegate {
    optional func dealCellDidSwitchChanged(switchCell: DealCell, changeValue value: Bool)
}

class DealCell: UITableViewCell {
    weak var delegate: DealCellDelegate?
    
    @IBOutlet weak var onSwitch: UISwitch!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func switchedDeal(sender: UISwitch) {
        print("deal switched")
        delegate?.dealCellDidSwitchChanged!(self, changeValue:onSwitch.on)
    }
}
