//
//  BusinessCell.swift
//  Yelp
//
//  Created by Thang Nguyen on 7/13/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit
import AFNetworking
class BusinessCell: UITableViewCell {
    
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var reviewCountLabel: UILabel!
    @IBOutlet weak var reviewImageView: UIImageView!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var picImageView: UIImageView!
    
    var business: Business! {
        didSet{
            
            picImageView.setImageWithURL(self.business.imageURL!)
          
            
            nameLabel.text = business.name
            distanceLabel.text = business.distance
            addressLabel.text = business.address
            categoryLabel.text = business.categories
            reviewImageView.setImageWithURL(business.ratingImageURL!)
            reviewCountLabel.text = "\(business.reviewCount!) reviews"
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
