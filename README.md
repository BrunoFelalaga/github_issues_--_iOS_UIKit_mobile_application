### **You've Got Issues: iOS App**

This project demonstrates fetching, displaying, and interacting with GitHub issues using UIKit. It allows users to view open and closed issues, see issue details, and navigate to the GitHub page for each issue.

---

### **Features**
- **Dynamic Issue Fetching**:
  - Uses `GitHubClient` class to fetch open or closed issues via the GitHub API.
  - Displays the issues with their title, creator, and state using a custom table view.

- **Issue Details**:
  - Provides a detailed views for each issue, including the description, creation date, the username,  and a Safari button to view the issue on GitHub.

- **Pull-to-Refresh**:
  - Updates the issue list in both open and closed dynamically with a refresh control for real-time updates.

---

### **Technologies Used**
- **UIKit**: For building and managing the user interface.
- **URLSession**: To make asynchronous API requests.
- **JSONDecoder**: For decoding GitHub API responses from JSON into desired format.
- **UITableView**: To display lists of issues with custom cells.
- 

---

### **Setup**
1. Clone the repository:
   ```bash
   git clone <repository_url>
   ```
2. Open `YouveGotIssues.xcodeproj` in Xcode.
3. Build and run the app on a simulator or device.
4. Ensure that you have an active internet connection for GitHub API calls.

---

### **Acknowledgments**
- Apple Developer Documentation
- Stack Overflow for Swift and UIKit solutions
    -- https://forums.swift.org/t/concurrent-downloads-with-async-task-group/59282

This README provides an overview of the app's functionality, setup instructions, and the technologies used. Let me know if you need more details!