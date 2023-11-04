//
//  CharacterListViewBuilder.swift
//  InvioCase-RickandMorty
//
//  Created by Samed Dağlı on 22.03.2023.
//

import UIKit

struct CharacterListViewBuilder {
    static func build() -> UIViewController {
        let vc = CharacterListViewController()
        let viewModel = CharacterListViewModel(locationsService: ServiceContainer.locationsService, charactersService: ServiceContainer.charactersService)
        
        vc.viewModel = viewModel
        viewModel.delegate = vc
        
        return vc
    }
}
