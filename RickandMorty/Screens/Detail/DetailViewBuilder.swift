//
//  DetailViewBuilder.swift
//  InvioCase-RickandMorty
//
//  Created by Samed Dağlı on 31.03.2023.
//

import UIKit

struct DetailViewBuilder {
    static func build(character: Character) -> UIViewController {
        let vc = DetailViewController()
        let viewModel = DetailViewModel(character: character)
        
        vc.viewModel = viewModel
        viewModel.delegate = vc
        
        return vc
    }
}
