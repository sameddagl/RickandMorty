//
//  CharactersEndPoint.swift
//  InvioCase-RickandMorty
//
//  Created by Samed Dağlı on 23.03.2023.
//

import Foundation

enum CharactersEndPoint: HTTPEndpoint {
    case getCharacters(ids: String)
    
    var path: String {
        switch self {
        case .getCharacters(let ids):
            return "\(Paths.characters)\(ids)"
        }
    }
    
    var params: [URLQueryItem] {
        return []
    }
}
