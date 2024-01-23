//
//  NetworkManager.swift
//  usg-mac
//
//  Created by Michael Marshall on 1/14/24.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    static let baseUrl = "http://localhost:8083/"
    
    private init () {}
    
    func postRequestWithNodeListResponse<T: Encodable, R: Decodable>(endpoint: String, body: T, res: R, completed: @escaping (Result<R, NetError>) -> Void) {
        guard let url = URL(string: NetworkManager.baseUrl + endpoint) else {
            completed(.failure(.InvalidUrl))
            return 
        }
        
        var req = URLRequest(url: url)
        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        req.setValue("application/json", forHTTPHeaderField: "Accept")
        req.httpMethod = "POST"
        
        let encoder = JSONEncoder()
        do {
            let postBody = try encoder.encode(body)
            req.httpBody = postBody
        } catch {
            return
        }
        
        let task = URLSession.shared.dataTask(with: req) { data, response, error in

            if let err = error {
                completed(.failure(.UnableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.InvalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.InvalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(R.self, from: data)
                
                completed(.success(decodedResponse))
                
            } catch {
                completed(.failure(.InvalidResponse))
            }
            
        }
        
        task.resume()
        
        
    }
    
}
