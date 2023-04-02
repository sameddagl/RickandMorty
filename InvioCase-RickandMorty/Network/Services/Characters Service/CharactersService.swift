//
//  CharactersService.swift
//  InvioCase-RickandMorty
//
//  Created by Samed Dağlı on 23.03.2023.
//

import Foundation

protocol CharactersServiceProtocol {
    func getCharacters(endPoint: HTTPEndpoint, completion: @escaping (Result<[Character], NetworkError>) -> Void)
    func getCharacter(endPoint: HTTPEndpoint, completion: @escaping (Result<Character, NetworkError>) -> Void)
}

final class CharactersService: CharactersServiceProtocol {
    private var service: ServiceProtocol
    
    init(service: ServiceProtocol) {
        self.service = service
    }

    /// Network call to get multiple characters
    func getCharacters(endPoint: HTTPEndpoint, completion: @escaping (Result<[Character], NetworkError>) -> Void) {
        service.fetch(endPoint: endPoint) { (result: Result<[Character], NetworkError>) in
            completion(result)
        }
    }
    
    /// Network call to get single character
    func getCharacter(endPoint: HTTPEndpoint, completion: @escaping (Result<Character, NetworkError>) -> Void) {
        service.fetch(endPoint: endPoint) { (result: Result<Character, NetworkError>) in
            completion(result)
        }
    }

}
