//
//  GitHubClient.swift
//  You've Got Issues!
//
//  Created by Bruno Felalaga on 1/26/25.
//

import Foundation


// Custom error types for network-related issues.
enum NetworkError: Error {
    case invalidURL  // URL is not valid
    case invalidResponse // Response status code is not in the 2xx range
    case invalidData // Data received is invalid
    case decodingError // Failed to decode JSON
}

// A client for interacting with the GitHub API to fetch issues.
class GitHubClient {
    // components to get to specific repo for the open and closed issues
    let baseURL = "https:api.github.com/repos"
    let owner = "pytorch"
    let repo = "vision"
    
    init() {}
    
    // Fetch issues from the GitHub API based on the specified state (e.g., "open", "closed").
    func fetchIssues(state: String) async throws -> [GithubIssue] {
        // Construct the API URL with class vars
        let urlString = "\(baseURL)/\(owner)/\(repo)/issues?state=\(state)"
        
        guard let url = URL(string: urlString) else { throw NetworkError.invalidURL }
        
        var request = URLRequest(url: url)
        request.setValue("application/vnd.github.v3+json", forHTTPHeaderField: "Accept")
        let (data, response) = try await URLSession.shared.data(for: request)
        
        // Ensure the response status code is valid
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else { throw NetworkError.invalidResponse }
        
        do { // Decode JSON into GitHubIssues 
            let decoder = JSONDecoder()
            return try decoder.decode([GithubIssue].self, from: data)
            
        } catch { // throw network errors when decoding fails
            print("Decoding error: \(error)")
            throw NetworkError.decodingError 
        }
    }
    
}
