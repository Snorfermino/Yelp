//
//  MilePickerViewController.swift
//  Yelp
//
//  Created by Thang Nguyen on 7/18/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit
@objc protocol MilePickerViewControllerDelegate{
    optional func milePickerController(mileVC: MilePickerViewController, selectedDistance distance: Double)
}
class MilePickerViewController: UIViewController {
    
    weak var delegate:MilePickerViewControllerDelegate?
    
    @IBOutlet weak var milePicker: UIPickerView!
    
    let milesSelections = [["name" :"Auto", "value": 0],
                           ["name":"0.3 miles", "value": 0.3],
                           ["name":"1 mile", "value": 1],
                           ["name":"5 miles" , "value ": 5],
                           ["name": "20 miles","value" : 20]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        milePicker.dataSource = self
        milePicker.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func pressedCancel(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func pressedSave(sender: UIBarButtonItem) {
        var distance = milesSelections[milePicker.selectedRowInComponent(0)]
        print(distance)
        //var filters = [String]()
      
            delegate?.milePickerController!(self, selectedDistance: distance["value"] as! Double)
        
        dismissViewControllerAnimated(true, completion: nil)
    }

    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
extension MilePickerViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // returns the # of rows in each component..
    @available(iOS 2.0, *)
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return milesSelections.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return milesSelections[row]["name"] as? String
    }
    
}
