//
//  DetailViewModel.swift
//  InvioCase-RickandMorty
//
//  Created by Samed Dağlı on 31.03.2023.
//

import Foundation

final class DetailViewModel: DetailViewModelProtocol {
    weak var delegate: DetailViewDelegate?
    
    private let character: Character
    
    init(character: Character) {
        self.character = character
    }
    
    func load() {
        notify(.updateCharacter(CharacterDetailPresentation(character: character, episodes: parseEpisodes(from: character.episode))))
    }
    
    private func parseEpisodes(from episodes: [String]) -> String {
        var intEpisodes = [Int]()
        
        episodes.forEach { episode in
            intEpisodes.append(Int.parse(from: episode))
        }
        
        let stringEpisodes = intEpisodes.compactMap { String($0) }.joined(separator:", ")
        
        return stringEpisodes
    }
    
    private func notify(_ output: DetailViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
}
