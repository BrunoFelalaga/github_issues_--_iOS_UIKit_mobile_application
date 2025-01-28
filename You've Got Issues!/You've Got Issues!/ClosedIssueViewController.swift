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
    override init(nibName: String?, bundle: Bundle?) {
        super.init(nibName: nibName, bundle: bundle)
        tabBarItem.title = "Closed"
        tabBarItem.image = UIImage(systemName: "envelope.badge.fill")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        tabBarItem.title = "Closed"
        tabBarItem.image = UIImage(systemName: "envelope.badge.fill")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Closed Issues" // this sets the top bar title, but why?
        let navBarAppearance = UINavigationBarAppearance()
//        navBarAppearance.titleTextAttributes = "Open Issues"
        navBarAppearance.backgroundColor = .systemGreen
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
//        
        navigationController?.tabBarItem.title = "Closed"
//        navigationController?.tabBarItem.image = UIImage(systemName: "envelope.badge.fill")
//        
//        
//        tabBarItem.title = "Closed"
//        tabBarItem.image = UIImage(systemName: "envelope.badge.fill")
//        title = "Closed Issues"
        
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
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return issues.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "IssueCell", for: indexPath) as? IssueTableViewCell else {
            return UITableViewCell()
        }
        
        let issue = issues[indexPath.row]
        cell.titleLabel.text = issue.title
        cell.usernameLabel.text = "@\(issue.user.login)"
        cell.stateImageView.image = UIImage(systemName: issue.state == "closed" ? "envelope.badge.fill" : "envelope.open.fill")
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "ShowIssueDetail", sender: self)
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowIssueDetail" {
            if let destination = segue.destination as? IssuesDetailViewController {
                if let selectedIndexPath = tableView.indexPathForSelectedRow {
                    destination.issue = issues[selectedIndexPath.row]
                }
            }
        }
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
