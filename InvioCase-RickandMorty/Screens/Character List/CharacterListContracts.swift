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
    func select(at index: Int)
}

enum CharacterListOutput {
    case startLoading
    case endLoading
    case updateLocations([CharacterListPresentation])
}

enum CharacterListRoute {
    case detail
}

protocol CharacterListViewDelegate: AnyObject {
    func handleOutput(_ output: CharacterListOutput)
    func navigate(to route: CharacterListRoute)
}
