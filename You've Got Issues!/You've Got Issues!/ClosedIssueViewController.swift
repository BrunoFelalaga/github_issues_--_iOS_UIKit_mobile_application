//
//  ClosedIssueViewController.swift
//  You've Got Issues!
//
//  Created by Bruno Felalaga on 1/25/25.
//

import Foundation
import UIKit

class ClosedIssueViewController: UITableViewController {
    var issues: [GithubIssue] = []
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        tabBarItem.title = "Closed"
//        tabBarItem.image = UIImage(systemName: "envelope.badge.fill")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.tabBarItem.title = "Closed"
        navigationController?.tabBarItem.image = UIImage(systemName: "envelope.badge.fill")
        title = "Closed Issues"
        
        Task {
            do {
                
                let issues = try await GitHubClient().fetchIssues(state: "closed")
                self.issues = issues
                self.tableView.reloadData()
                print("CLOSED issues: \(issues.count)")
                
            } catch {
                print("Error fetching Closed Issues: \(error)")
            }
        }
        
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(refreshData), for: .valueChanged)
    }
    
    
    @objc private func refreshData() {
        
        Task {
            do {
                
                let issues = try await GitHubClient().fetchIssues(state: "closed")
                self.issues = issues
                self.tableView.reloadData()
                //print("issues: \(issues.count)")
                refreshControl?.endRefreshing()
                
            } catch {
                print("Error fetching Closed Issues: \(error)")
                refreshControl?.endRefreshing()
            }
        }
        
    }
    
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "ShowIssueDetail" {
//            let destination = segue.destination as? IssuesDetailViewController,
//            let selectedIndexPath = tableView.indexPathForSelectedRow {
//                let issue = issues[selectedIndePath.row]
//                }
//                
//            destination.issue = issue
//        }
//    }
}
