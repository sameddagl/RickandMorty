//
//  DetailViewModel.swift
//  InvioCase-RickandMorty
//
//  Created by Samed Dağlı on 31.03.2023.
//

import Foundation

final class DetailViewModel: DetailViewModelProtocol {
    weak var delegate: DetailViewDelegate?
    
    //MARK: - Injections
    private let character: Character
    
    init(character: Character) {
        self.character = character
    }
    
    //MARK: - Main Methods
    func load() {
        let presentation = CharacterDetailPresentation(character: character, episodes: Helper.parseInts(from: character.episode))
        notify(.updateCharacter(presentation))
    }
    
    //MARK: - Helper Methods
    private func notify(_ output: DetailViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
}
