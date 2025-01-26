//
//  GitHubClient.swift
//  You've Got Issues!
//
//  Created by Bruno Felalaga on 1/26/25.
//

import Foundation


enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case decodingError
}


//final class GitHubClient {
class GitHubClient {
    
    let baseURL = "https:api.github.com/repos"
    let owner = "pytorch"
    let repo = "vision"
    
    init() {}
    
    func fetchIssues(state: String) async throws -> [GithubIssue] {
        let urlString = "\(baseURL)/\(owner)/\(repo)/issues?state=\(state)"
        
        guard let url = URL(string: urlString) else { throw NetworkError.invalidURL }
        
        var request = URLRequest(url: url)
        request.setValue("application/vnd.github.v3+json", forHTTPHeaderField: "Accept")
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else { throw NetworkError.invalidResponse }
        
        do {
            let decoder = JSONDecoder()
//            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode([GithubIssue].self, from: data)
            
        } catch {
            print("Decoding error: \(error)")
            throw NetworkError.decodingError
        }
    }
    
}
