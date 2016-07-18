//
//  DistanceCell.swift
//  Yelp
//
//  Created by Thang Nguyen on 7/17/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit
@objc protocol DistanceCellDelegate {
    optional func distanceCell(distanceCell: DistanceCell, didChangeValue value: Bool)
    
}
class DistanceCell: UITableViewCell {
    @IBOutlet weak var selectedLabel: UILabel!
    var delegate:DistanceCellDelegate?
    var selectedMile:String?
    @IBOutlet weak var distancePicker: UIPickerView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
