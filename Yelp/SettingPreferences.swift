//
//  SettingPreferences.swift
//  Yelp
//
//  Created by Thang Nguyen on 7/17/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import Foundation
class SettingPreferences{
    var sortMode:Int = 0
    var distanceMode:Double = 0.0
    var switchStates = [Int : Bool] ()

    
    static let sharedInstance = SettingPreferences()

}