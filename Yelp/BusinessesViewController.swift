//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit
import MBProgressHUD
class BusinessesViewController: UIViewController, FiltersViewControllerDelegate, UISearchBarDelegate {

    var businesses: [Business]!
    //var filteredData:[String]!
    var filteredBusinesses: [Business]!
    let searchController = UISearchController(searchResultsController: nil)
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 120

        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        
        tableView.tableHeaderView = searchController.searchBar
        
        tableView.rowHeight = UITableViewAutomaticDimension
        
        Business.searchWithTerm("", completion: { (businesses: [Business]!, error: NSError!) -> Void in
            self.businesses = businesses
            self.filteredBusinesses = businesses
            self.tableView.reloadData()
            
        })


    }

    
    
    
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        filteredBusinesses = businesses.filter { Business in
            let name = Business.name
            
            if(name!.containsString(searchText)){
                return true
            }
            return false
        }
        
        tableView.reloadData()
    }
 
            

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let navController = segue.destinationViewController as! UINavigationController
        let filterVC  = navController.topViewController as! FiltersViewController
        filterVC.delegate = self
    }
    func filtersViewController(filterVC: FiltersViewController, didUpdateFilter filter: [String], didUpdateSort sortMode: Int, didUpdateDistance distanceMode: Double, didUpdateDeal isDealOn: Bool) {
        print("businessVC got filter from filterVC")
        var sortModeSelected:YelpSortMode
        switch sortMode{
        case 0 :
            sortModeSelected = YelpSortMode.BestMatched
        case 1 :
            sortModeSelected = YelpSortMode.Distance
        case 2:
            sortModeSelected = YelpSortMode.HighestRated
        default: sortModeSelected = YelpSortMode.BestMatched
        }
        Business.searchWithTerm("", sort: sortModeSelected, categories: filter, deals: isDealOn) {   (businesses: [Business]!, error: NSError!) in
            self.filteredBusinesses = businesses.filter({
                let miles = $0.distance!.characters.split{$0 == " "}.map(String.init)
                let mileValue = Double(miles[0])
                return (mileValue < distanceMode)
            })
            
            for busines in businesses{
                print(busines)
            }
            self.filteredBusinesses = businesses
            self.tableView.reloadData()
        }
    }

}

extension BusinessesViewController: UITableViewDelegate, UITableViewDataSource {
   
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if filteredBusinesses != nil {
            return filteredBusinesses.count
        } else {
            return 0
        }
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("BusinessCell") as! BusinessCell

            
        
        cell.business = filteredBusinesses[indexPath.row]
       
        
        
        return cell
    }

}

extension BusinessesViewController: UISearchResultsUpdating{
    func updateSearchResultsForSearchController(searchController: UISearchController)
    {
        //filterContentForSearchText(searchController.searchBar.text!)
        
        if let searchText = searchController.searchBar.text {
            filteredBusinesses = searchText.isEmpty ? businesses : businesses.filter(
                {($0.name?.containsString(searchText))! || ($0.categories?.containsString(searchText))! || ($0.address?.containsString(searchText))!}
            )
            
            tableView.reloadData()
        }
    }
    
}
