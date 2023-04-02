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
        let episodes = Helper.joinedByComma(stringArray: Helper.parseInts(from: character.episode))
        let presentation = CharacterDetailPresentation(character: character, episodes: episodes)
        notify(.updateCharacter(presentation))
    }
    
    //MARK: - Helper Methods
    private func notify(_ output: DetailViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
}
