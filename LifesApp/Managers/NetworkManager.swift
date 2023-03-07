//
//  NetworkManager.swift
//  LifesApp
//
//  Created by Şükrü Özkoca on 6.03.2023.
//

import Alamofire

class NetworkManager {
    
    static func request<T: Codable>(type: T.Type, url: String, method: HTTPMethod, completion: @escaping((Result<T, ErrorTypes>) -> ())) {
        
        let headers: HTTPHeaders = [
            "content-type": "application/json",
            "authorization": "apikey 5OmwXm6mqmiuHeWsbgTeUz:7HImIzlQpQVeE4Z3VSzuH8"
            
            //apikey 1xxQFOt2vdVYQWmjhRuiyd:4dOULDRqtae9RikcSeCEIZ
            //
        ]
        
        AF.request(url, method: method, headers: headers).response { response in
            switch response.result {
            case .success(let data):
                self.handleResponse(data: data!) { response in
                    completion(response)
                }
            case .failure(_):
                completion(.failure(.unknownError))
            }
        }
    }
    
    private static func handleResponse<T: Codable>(data: Data, completion: @escaping((Result<T, ErrorTypes>) -> ())) {
        do {
            let result = try JSONDecoder().decode(T.self, from: data)
            completion(.success(result))
        } catch {
            completion(.failure(.invalidData))
        }
    }
    
    
}
