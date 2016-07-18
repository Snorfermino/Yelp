//
//  SortViewController.swift
//  Yelp
//
//  Created by Thang Nguyen on 7/18/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit
@objc protocol SortViewControllerDelegate{
    optional func sortViewController(sortVC: SortViewController, selectedOpt option: Int)
}
class SortViewController: UIViewController {
    weak var delegate:SortViewControllerDelegate?
    @IBOutlet weak var sortPicker: UIPickerView!
    let sortSelections = [["name" :"Best Match", "value": 0],
                           ["name":"Distance", "value": 1],
                           ["name":"Highest Rate", "value": 2]]
    override func viewDidLoad() {
        super.viewDidLoad()
        sortPicker.delegate = self
        sortPicker.dataSource = self

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
        var option = sortSelections[sortPicker.selectedRowInComponent(0)]
        print(option)
        delegate?.sortViewController!(self, selectedOpt: option["value"] as! Int)
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

extension SortViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // returns the # of rows in each component..
    @available(iOS 2.0, *)
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sortSelections.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return sortSelections[row]["name"] as! String
    }
    

}
