//
//  IssuesDetailViewController.swift
//  You've Got Issues!
//
//  Created by Bruno Felalaga on 1/25/25.
//

import UIKit

//GitHub user with a login name.
struct GitHubUser: Codable {
    let login: String
}

/// GitHub issue with key details.
struct GithubIssue: Codable {
    let title: String?
    let createdAt: String
    let body: String?
    let state: String
    let user: GitHubUser
    let htmlUrl: String
    
    enum CodingKeys: String, CodingKey {
        
        case title
        case createdAt = "created_at" 
        case body
        case state
        case user
        case htmlUrl = "html_url" 
        
    }
}


// Displays details of a specific GitHub issue when table cell is clicked on 
class IssuesDetailViewController: UIViewController {
    
    // Issue properties connected as segue table cells
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var bodyTextView: UITextView!
    @IBOutlet weak var stateImageView: UIImageView!
    
    var issue: GithubIssue?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar() // Configure the navigation bar

        
        guard let issue = issue else { return } // make sure issue exists
        
        // Populate the UI with issue details
        titleLabel.text = issue.title
        usernameLabel.text = "@\(issue.user.login)"
        bodyTextView.text = issue.body
        
        // set up date label from created at property of issue
        if let date = apiDateFormatter.date(from: issue.createdAt) {
            dateLabel.text = displayDateFormatter.string(from: date)
        }
       
        // set up open/closed image for detail
        stateImageView.image = UIImage(systemName: issue.state == "open" ? "envelope.open.fill" : "envelope.badge.fill")
    }
    
    // Sets up the navigation bar with a Safari button to open issue into safari
    private func setupNavigationBar() {
        let safariButton = UIBarButtonItem(
            image: UIImage(systemName: "safari"),
            style: .plain,
            target: self,
            action: #selector(openInSafari)
        )
        navigationItem.rightBarButtonItem = safariButton
    }
    

    // Open the issue in Safari.
    @objc private func openInSafari() {
        guard let issue = issue,
                let url = URL(string: issue.htmlUrl) else { return }
        UIApplication.shared.open(url)
    }
    

    // Format API date strings with specific date format before display
    private let apiDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyy-MM-dd'T'HH:mm:ssZ"
        return formatter
    }()
    

    // Formats dates for display
    private let displayDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }()
    
    
}
