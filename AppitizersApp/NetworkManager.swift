//
//  NetworkManager.swift
//  AppitizersApp
//
//  Created by Sambhav Singh on 09/11/24.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    static let baseURL: String = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    
    private let appetizersURL: String = baseURL + "appetizers"
    
    private init() {}
    
    func getAppetizers(completion: @escaping (Result<[Appitizers], APError>) -> Void) {
        guard let url = URL(string:appetizersURL) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completion(.failure(.unableToCompleteRequest))
                return
            }
            
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else{
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(AppitizersResponse.self, from: data)
                completion(.success(decodedResponse.request))
            }catch {
                completion(.failure(.invalidData))
            }
        }
        task.resume()
    }
}
