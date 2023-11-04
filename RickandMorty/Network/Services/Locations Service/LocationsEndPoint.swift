//
//  LocationsEndPoint.swift
//  InvioCase-RickandMorty
//
//  Created by Samed Dağlı on 22.03.2023.
//

import Foundation

enum LocationsEndPoint: HTTPEndpoint {
    case getLocations(page: Int)
    
    var path: String {
        return Paths.locations
    }
    
    var params: [URLQueryItem] {
        switch self {
        case .getLocations(let page):
            return [
                URLQueryItem(name: "page", value: String(page))
            ]
        }
    }
}
