//
//  webService.swift
//  Capstone
//
//  Created by Anuntaya Kitiporn on 29/4/2566 BE.
//

import Foundation

var jwttoken: String = ""

enum AuthenticationError: Error {
    case invalidCredentials
    case custom(errorMessage: String)
}

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

struct LoginRequestBody: Codable {
    let username: String
    let password: String
}


struct LoginResponse: Codable {
    let access_token: String?
}

class Webservice {

    func login(username: String, password: String, completion: @escaping (Result<String, AuthenticationError>) -> Void) {
        
        guard let url = URL(string: "https://206a-1-47-134-3.ngrok-free.app/auth/login") else {
            completion(.failure(.custom(errorMessage: "URL is not correct")))
            return
        }
        
        let body = LoginRequestBody(username: username, password: password)
        print(body)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data, error == nil else {
                completion(.failure(.custom(errorMessage: "No data")))
                return
            }
            
            try! JSONDecoder().decode(LoginResponse.self, from: data)
            
            guard let loginResponse = try? JSONDecoder().decode(LoginResponse.self, from: data) else {
                completion(.failure(.invalidCredentials))
                return
            }
        
            
            guard let token = loginResponse.access_token
            else {
                completion(.failure(.invalidCredentials))
                return
            }
            jwttoken = token
            completion(.success(token))
            
        }.resume()
        
    }
    
}
