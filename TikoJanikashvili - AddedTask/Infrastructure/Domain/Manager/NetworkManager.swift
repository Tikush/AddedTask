//
//  NetworkManager.swift
//  TikoJanikashvili - AddedTask
//
//  Created by Tiko Janikashvili on 17.12.22.
//

import Foundation

enum EndPoint: String {
    case country = "https://countriesnow.space/api/v0.1/countries/flag/images"
    case city = "https://countriesnow.space/api/v0.1/countries/cities"
}

typealias completionBlock<T: Codable> = (Result<T, Error>) -> Void

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func get<T: Codable>(with url: String, completion: @escaping completionBlock<T>) {
        
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error {
                completion(.failure(error))
            }
            
            guard let response = response as? HTTPURLResponse else {
                return
            }

            guard (200...299).contains(response.statusCode) else {
                print("wrong response")
                return
            }
             
            guard let data = data else { return }
            
            do {
                let decoder = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decoder))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    func post<T: Codable>(with url: String, countryName: String, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: url) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let json: [String: String] = ["country": countryName]
        let bodyData = try? JSONSerialization.data(withJSONObject: json)
        
        request.httpBody = bodyData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error {
                print(error.localizedDescription)
            }
            
            guard let data = data else { return }
            
            do {
                let responseJSON = try JSONDecoder().decode(T.self, from: data)
                completion(.success(responseJSON))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
