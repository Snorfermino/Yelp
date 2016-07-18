//
//  FilterCell.swift
//  Yelp
//
//  Created by Thang Nguyen on 7/13/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

 @objc protocol FilterCellDelegate {
     optional func switchCell(switchCell: FilterCell, didChangeValue value: Bool)
    
}
class FilterCell: UITableViewCell {
    
    
    @IBOutlet weak var filterSwitch: UISwitch!
    @IBOutlet weak var propertyLabel: UILabel!
    
    weak var delegate :  FilterCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func turnedOn(sender: UISwitch) {
        print("switched")
        delegate?.switchCell?(self, didChangeValue: filterSwitch.on)
    }

}
