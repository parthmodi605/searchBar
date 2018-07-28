//
//  ViewController.swift
//  Search
//
//  Created by Parth on 27/07/18.
//  Copyright © 2018 Parth. All rights reserved.
//

import UIKit

class ViewController: UITableViewController,UISearchResultsUpdating {
    
    
    var filterArr = [String]()
    var arr = ["m","ma","mac","macb","macbo","macboo","macbook"]
    var searchController:UISearchController!
    var resultController = UITableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        self.searchController = UISearchController(searchResultsController: self.resultController)
        self.tableView.tableHeaderView = self.searchController.searchBar
        self.searchController.searchResultsUpdater = self
        self.searchController.searchBar.placeholder = "Enter Any Keyword..."
        self.resultController.tableView.delegate = self
        self.resultController.tableView.dataSource = self
        self.searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func updateSearchResults(for searchController: UISearchController) {
       self.filterArr = self.arr.filter { (arr:String) -> Bool in
        if arr.lowercased().contains(self.searchController.searchBar.text!.lowercased()){
            return true
        }else{
            return false
        }
    }
        self.resultController.tableView.reloadData()
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.tableView{
            return self.arr.count

        }else{
            return self.filterArr.count

        }

        }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if tableView == self.tableView{

            cell.textLabel?.text = self.arr[indexPath.row]
        }
        else{
            cell.textLabel?.text = self.filterArr[indexPath.row]

        }

        return cell
    }
    
    

}

