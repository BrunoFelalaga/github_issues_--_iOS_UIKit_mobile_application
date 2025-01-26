//
//  OpenIssueViewController.swift
//  You've Got Issues!
//
//  Created by Bruno Felalaga on 1/25/25.
//

import Foundation
import UIKit

class OpenIssueViewController: UITableViewController {
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        tabBarItem.title = "Open"
//        tabBarItem.image = UIImage(systemName: "envelope.open.fill")
//    }
    var issues: [GithubIssue] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.tabBarItem.title = "Open"
        navigationController?.tabBarItem.image = UIImage(systemName: "envelope.open.fill")
        title = "Open Issues"
        
        Task {
            do {
                
                let issues = try await GitHubClient().fetchIssues(state: "open")
                self.issues = issues
                self.tableView.reloadData()
                
            } catch {
                print("Error fetching Open Issues: \(error)")
            }
        }
    }
}
