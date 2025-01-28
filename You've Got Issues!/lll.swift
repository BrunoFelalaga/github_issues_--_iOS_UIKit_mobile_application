class BaseIssueViewController: UITableViewController {
    var issues: [GithubIssue] = []
    var issueState: String { fatalError("Subclasses must override issueState") }
    var navigationBarColor: UIColor { fatalError("Subclasses must override navigationBarColor") }
    var tabTitle: String { fatalError("Subclasses must override tabTitle") }
    var tabImage: String { fatalError("Subclasses must override tabImage") }
    
    override init(nibName: String?, bundle: Bundle?) {
        super.init(nibName: nibName, bundle: bundle)
        setupTabBar()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupTabBar()
    }
    
    private func setupTabBar() {
        tabBarItem.title = tabTitle
        tabBarItem.image = UIImage(systemName: tabImage)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchIssues()
        setupRefreshControl()
    }
    
    private func setupUI() {
        title = "\(tabTitle) Issues"
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = navigationBarColor
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationController?.tabBarItem.title = tabTitle
    }
    
    private func setupRefreshControl() {
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(refreshData), for: .valueChanged)
    }
    
    private func fetchIssues() {
        Task {
            do {
                let issues = try await GitHubClient().fetchIssues(state: issueState)
                self.issues = issues
                self.tableView.reloadData()
            } catch {
                print("Error fetching \(tabTitle) Issues: \(error)")
            }
        }
    }
    
    @objc private func refreshData() {
        Task {
            do {
                let issues = try await GitHubClient().fetchIssues(state: issueState)
                self.issues = issues
                self.tableView.reloadData()
                refreshControl?.endRefreshing()
            } catch {
                print("Error fetching \(tabTitle) Issues: \(error)")
                refreshControl?.endRefreshing()
            }
        }
    }
    
    // MARK: - Table View Data Source
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
        cell.stateImageView.image = UIImage(systemName: issue.state == "open" ? "envelope.open.fill" : "envelope.badge.fill")
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "ShowIssueDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowIssueDetail",
           let destination = segue.destination as? IssuesDetailViewController,
           let selectedIndexPath = tableView.indexPathForSelectedRow {
            destination.issue = issues[selectedIndexPath.row]
        }
    }
}

class OpenIssueViewController: BaseIssueViewController {
    override var issueState: String { "open" }
    override var navigationBarColor: UIColor { .systemRed }
    override var tabTitle: String { "Open" }
    override var tabImage: String { "envelope.open.fill" }
}


class ClosedIssueViewController: BaseIssueViewController {
    override var issueState: String { "closed" }
    override var navigationBarColor: UIColor { .systemGreen }
    override var tabTitle: String { "Closed" }
    override var tabImage: String { "envelope.badge.fill" }
}