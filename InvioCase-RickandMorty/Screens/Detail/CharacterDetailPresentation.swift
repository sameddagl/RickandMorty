//
//  CharacterDetailPresentation.swift
//  InvioCase-RickandMorty
//
//  Created by Samed Dağlı on 31.03.2023.
//

import Foundation

struct CharacterDetailPresentation {
    let name: String
    let image: String
    let status: String
    let specy: String
    let gender: String
    let origin: String
    let location: String
    let episodes: String
    let createdAt: String
    
    
    init(character: Character, episodes: String) {
        self.name = character.name
        self.image = character.image
        self.status = character.status
        self.specy = character.species
        self.gender = character.gender
        self.origin = character.origin.name
        self.location = character.location.name
        self.episodes = episodes
        self.createdAt = character.created
    }
}
