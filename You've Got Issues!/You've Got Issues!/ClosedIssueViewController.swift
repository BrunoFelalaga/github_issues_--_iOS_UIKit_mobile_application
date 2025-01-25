//
//  ClosedIssueViewController.swift
//  You've Got Issues!
//
//  Created by Bruno Felalaga on 1/25/25.
//

import Foundation
import UIKit

class ClosedIssueViewController: UITableViewController {
    let issues: [String] = []
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowIssueDetail",
           let destination = segue.destination as? IssuesDetailViewController,
           let issue = issues[selectedIndexPath.row]
           destination.issue = issue
    }
}
