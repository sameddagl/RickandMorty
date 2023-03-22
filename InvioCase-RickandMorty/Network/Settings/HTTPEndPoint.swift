//
//  HTTPEndPoint.swift
//  InvioCase-RickandMorty
//
//  Created by Samed Dağlı on 22.03.2023.
//

import Foundation

protocol HTTPEndpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var params: [URLQueryItem] { get }
    var method: HTTPMethod { get }
}

extension HTTPEndpoint {
    var scheme: String {
        return "https"
    }
    
    var host: String {
        return "rickandmortyapi.com"
    }
    
    var method: HTTPMethod {
        return .get
    }
}
