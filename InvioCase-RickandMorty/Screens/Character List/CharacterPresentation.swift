//
//  CharacterPresentation.swift
//  InvioCase-RickandMorty
//
//  Created by Samed Dağlı on 23.03.2023.
//

import Foundation

struct CharacterPresentation {
    let name: String
    let image: String
    let gender: String
    
    init(character: Character) {
        self.name = character.name
        self.image = character.image
        self.gender = character.gender
    }
}
