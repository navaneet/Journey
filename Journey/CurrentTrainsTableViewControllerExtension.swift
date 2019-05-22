//
//  CurrentTrainsTableViewControllerExtension.swift
//  Journey
//
//  Created by Navaneet Sarma on 10/05/19.
//  Copyright © 2019 demo. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Table view data source

extension CurrentTrainsTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseID", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        let train = tableViewData[indexPath.row]
        cell.textLabel?.text = train.message.replaceLineBreaks()
        cell.detailTextLabel?.attributedText = train.getAttributedString()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return tableViewData.isEmpty ? (reachability.connection != .none ? "" : "Network Error") : "Upcoming Trains"
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        view.endEditing(true)
        let train = tableViewData[indexPath.row]
        let detailsViewController = DetailsViewController(train)
        self.navigationController?.pushViewController(detailsViewController, animated: true)
    }
}

// MARK: - Search Bar Delegate Implementation

extension CurrentTrainsTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            tableViewData = trains
        } else {
            tableViewData = trains.filter() { $0.message.lowercased().contains(searchText.lowercased()) }
        }
        
        currentTrainsTableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
}
