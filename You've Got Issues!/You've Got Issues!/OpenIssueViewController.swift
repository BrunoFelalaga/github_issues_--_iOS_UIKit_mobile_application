//
//  OpenIssueViewController.swift
//  You've Got Issues!
//
//  Created by Bruno Felalaga on 1/25/25.
//

import Foundation
import UIKit


class OpenIssueViewController: BaseIssueViewController {
    override var issueState: String { "open" }
    override var navigationBarColor: UIColor { .systemRed }
    override var tabTitle: String { "Open" }
    override var tabImage: String { "envelope.open.fill" }
}


//
//class OpenIssueViewController: UITableViewController {
//    var issues: [GithubIssue] = []
//    
//    
//    override init(nibName: String?, bundle: Bundle?) {
//        super.init(nibName: nibName, bundle: bundle)
//        tabBarItem.title = "Open"
//        tabBarItem.image = UIImage(systemName: "envelope.open.fill")
//    }
//    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        tabBarItem.title = "Open"
//        tabBarItem.image = UIImage(systemName: "envelope.open.fill")
//        
//    }
//    
//    override func viewDidLoad() {
//        
//        
//        super.viewDidLoad()
//        title = "Open Issues"
//        let navBarAppearance = UINavigationBarAppearance()
//        navBarAppearance.backgroundColor = .systemRed
//        navigationController?.navigationBar.standardAppearance = navBarAppearance
//        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
////
//        navigationController?.tabBarItem.title = "Open"
//
//        
//        Task {
//            do {
//                
//                let issues = try await GitHubClient().fetchIssues(state: "open")
//                self.issues = issues
//                self.tableView.reloadData()
//                print("OPEN issues: \(issues.count)")
//                
//            } catch {
//                print("Error fetching Open Issues: \(error)")
//            }
//        }
//        
//        self.tableView.reloadData() // ?? here?
//        
//        refreshControl = UIRefreshControl()
//        refreshControl?.addTarget(self, action: #selector(refreshData), for: .valueChanged)
//    }
//    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return issues.count
//    }
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "IssueCell", for: indexPath) as? IssueTableViewCell else {
//            return UITableViewCell() }
//        
//        let issue = issues[indexPath.row]
//        cell.titleLabel.text = issue.title
//        cell.usernameLabel.text = "@\(issue.user.login)"
//        cell.stateImageView.image = UIImage(systemName: issue.state == "open" ? "envelope.open.fill" : "envelope.badge.fill")
//        
//        return cell
//    }
//    
//    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
////        performSegue(withIdentifier: "ShowIssueDetail", sender: self)
//    }
//    
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "ShowIssueDetail" {
//            if let destination = segue.destination as? IssuesDetailViewController {
//                if let selectedIndexPath = tableView.indexPathForSelectedRow {
//                    destination.issue = issues[selectedIndexPath.row]
//                }
//            }
//        }
//    }
//   
//    @objc private func refreshData() {
//        
//        Task {
//            do {
//                
//                let issues = try await GitHubClient().fetchIssues(state: "open")
//                self.issues = issues
//                self.tableView.reloadData()
//                refreshControl?.endRefreshing()
//                
//            } catch {
//                print("Error fetching Open Issues: \(error)")
//                refreshControl?.endRefreshing()
//            }
//        }
//        
//    }
//}
