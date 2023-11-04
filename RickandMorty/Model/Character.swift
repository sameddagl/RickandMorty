//
//  Character.swift
//  InvioCase-RickandMorty
//
//  Created by Samed Dağlı on 23.03.2023.
//

import Foundation

// MARK: - Character
struct Character: Decodable {
    let name, status, species: String
    let gender: String
    let origin, location: CharacterLocation
    let image: String
    let episode: [String]
    let created: String
}

// MARK: - Location
struct CharacterLocation: Decodable {
    let name: String
}
