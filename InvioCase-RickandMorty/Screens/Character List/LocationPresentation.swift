//
//  CharacterListPresentation.swift
//  InvioCase-RickandMorty
//
//  Created by Samed Dağlı on 22.03.2023.
//

import Foundation

struct LocationPresentation {
    let name: String
    
    init(locationResult: LocationResult) {
        self.name = locationResult.name
    }
}
