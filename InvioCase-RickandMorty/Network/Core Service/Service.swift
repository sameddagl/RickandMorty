//
//  Service.swift
//  InvioCase-RickandMorty
//
//  Created by Samed Dağlı on 22.03.2023.
//

import Foundation

protocol ServiceProtocol {
    func fetch<T: Decodable>(endPoint: HTTPEndpoint, completion: @escaping(Result<T, NetworkError>) -> Void)
}

final class Service: ServiceProtocol {
    
    func fetch<T: Decodable>(endPoint: HTTPEndpoint, completion: @escaping (Result<T, NetworkError>) -> Void) {
        var components = URLComponents()
        components.scheme = endPoint.scheme
        components.host = endPoint.host
        components.path = endPoint.path
        components.queryItems = endPoint.params
        
        
        guard let url = components.url else {
            completion(.failure(.badURL))
            return
        }
                                
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endPoint.method.rawValue
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completion(.failure(.badURL))
                print(error)
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            switch response.statusCode {
            case 200...299:
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    let decodedData = try decoder.decode(T.self, from: data)
                    completion(.success(decodedData))
                }
                catch {
                    print(error)
                    completion(.failure(.decoding))
                }
            case 401:
                completion(.failure(.unauthorized))
            default:
                print(response.statusCode)
                completion(.failure(.unexpectedStatusCode))
            }
        }.resume()
    }
}
