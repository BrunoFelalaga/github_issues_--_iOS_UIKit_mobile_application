//
//  IssuesDetailViewController.swift
//  You've Got Issues!
//
//  Created by Bruno Felalaga on 1/25/25.
//

import UIKit

struct GitHubUser: Codable {
    let login: String
}
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
class IssuesDetailViewController: UITableViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var bodyTextView: UITextView!
    @IBOutlet weak var stateImageView: UIImageView!
    
    var issue: GithubIssue?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        let safariButton = UIBarButtonItem(
            image: UIImage(systemName: "safari"),
            style: .plain,
            target: self,
            action: #selector(openInSafari)
        )
        navigationItem.rightBarButtonItem = safariButton
    }
    
    @objc private func openInSafari() {
        guard let issue = issue,
                let url = URL(string: issue.htmlUrl) else { return }
        UIApplication.shared.open(url)
    }
    
    private let apiDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyy-MM-dd'T'HH:mm:ssZ"
        return formatter
    }()
    
    private let displayDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }()
    
    

    


}
