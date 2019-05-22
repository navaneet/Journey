//
//  CurrentTrainsTableViewController.swift
//  Journey
//
//  Created by Navaneet Sarma on 09/05/19.
//  Copyright © 2019 demo. All rights reserved.
//

import UIKit
import Reachability

class CurrentTrainsTableViewController: UITableViewController {
    
    @IBOutlet weak var currentTrainsTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let reachability = Reachability()!
    
    // Actual data source for table view
    var tableViewData: [Train] = []
    // Cached value to be used for refresh control
    var trains: [Train] = [] {
        didSet {
            tableViewData = trains
            reloadAnimations()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearsSelectionOnViewWillAppear = true
        currentTrainsTableView.refreshControl?.backgroundColor = UIColor.white
        currentTrainsTableView.backgroundColor = UIColor.white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged(note:)), name: .reachabilityChanged, object: reachability)
        try? reachability.startNotifier()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        reachability.stopNotifier()
        NotificationCenter.default.removeObserver(self, name: .reachabilityChanged, object: reachability)
    }
    
    /// Handling network change here so that data can be fetched on network status change
    ///
    /// - Parameter note: reachability notification
    @objc func reachabilityChanged(note: Notification) {
        let reachability = note.object as! Reachability
        switch reachability.connection {
        case .wifi:
            print("Reachable via WiFi")
            refreshTableView()
        case .cellular:
            print("Reachable via Cellular")
            refreshTableView()
        case .none:
            print("Network not reachable")
            showNetworkAlert(nil)
        }
    }
    
    /// Function that fetches current trains data from the network
    private func refreshTableView() {
        title = "Fetching Schedules ..."
        NetworkUtility().getCurrentTrains { [weak self] (trains) in
            DispatchQueue.main.async {
                if trains.isEmpty {
                    if self?.reachability.connection == .none {
                        self?.showNetworkAlert({
                            self?.dismissRefreshControl()
                        })
                    }
                    else {
                        self?.showDataAlert({
                            self?.dismissRefreshControl()
                        })
                    }
                } else {
                    self?.trains = trains
                    self?.dismissRefreshControl()
                }
                
                self?.title = ""
            }
        }
    }
    
    private func dismissRefreshControl() {
        currentTrainsTableView.refreshControl?.endRefreshing()
    }
    
    /// Function that takes care of the tableview reload animations
    private func reloadAnimations() {
        let range = NSMakeRange(0, currentTrainsTableView.numberOfSections)
        let sections = NSIndexSet(indexesIn: range)
        currentTrainsTableView?.reloadSections(sections as IndexSet, with: .automatic)
    }
    
    // MARK: - UIRefreshControl
    
    @IBAction func refresh(_ sender: UIRefreshControl) {
        refreshTableView()
    }
}
