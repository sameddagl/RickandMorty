//
//  CharactersEndPoint.swift
//  InvioCase-RickandMorty
//
//  Created by Samed Dağlı on 23.03.2023.
//

import Foundation

enum CharactersEndPoint: HTTPEndpoint {
    case getCharacters(ids: [Int])
    
    var path: String {
        switch self {
        case .getCharacters(let ids):
            let stringIDs = ids.compactMap{ String($0) }.joined(separator: ",")
            return "\(Paths.characters)\(stringIDs)"
        }
    }
    
    var params: [URLQueryItem] {
        return []
    }
}
