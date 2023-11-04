//
//  DetailViewContracts.swift
//  InvioCase-RickandMorty
//
//  Created by Samed Dağlı on 31.03.2023.
//

import Foundation

protocol DetailViewModelProtocol {
    var delegate: DetailViewDelegate? { get set }
    func load()
}

enum DetailViewModelOutput {
    case updateCharacter(CharacterDetailPresentation)
}


protocol DetailViewDelegate: AnyObject {
    func handleViewModelOutput(_ output: DetailViewModelOutput)
}
