//
//  CharacterListPresentation.swift
//  InvioCase-RickandMorty
//
//  Created by Samed Dağlı on 22.03.2023.
//

import Foundation

struct LocationPresentation {
    let name: String
    var isSelected: Bool = false
    
    init(locationResult: LocationResult) {
        self.name = locationResult.name
        self.isSelected = false
    }
}
