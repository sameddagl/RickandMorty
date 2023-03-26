//
//  Location.swift
//  InvioCase-RickandMorty
//
//  Created by Samed Dağlı on 22.03.2023.
//

import Foundation

struct Location: Decodable {
    let info: Info
    let results: [LocationResult]
}

// MARK: - Info
struct Info: Decodable {
    let pages: Int
}

// MARK: - LocationResult
struct LocationResult: Codable {
    let id: Int
    let name: String
    let residents: [String]
}
