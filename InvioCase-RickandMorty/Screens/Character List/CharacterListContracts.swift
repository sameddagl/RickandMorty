//
//  CharacterListContracts.swift
//  InvioCase-RickandMorty
//
//  Created by Samed Dağlı on 22.03.2023.
//

import Foundation

protocol CharacterListViewModelProtocol {
    var delegate: CharacterListViewDelegate? { get set }
    func load()
    func selectLocation(at index: Int)
    func selectCharacter(at index: Int)
}

enum CharacterListOutput {
    case startLoading
    case endLoading
    case updateLocations([LocationPresentation])
    case updateCharacters([CharacterPresentation])
    case failWithError(NetworkError)
    case showEmptyState(message: String)
}

enum CharacterListRoute {
    case detail(Character)
}

protocol CharacterListViewDelegate: AnyObject {
    func handleOutput(_ output: CharacterListOutput)
    func navigate(to route: CharacterListRoute)
}
