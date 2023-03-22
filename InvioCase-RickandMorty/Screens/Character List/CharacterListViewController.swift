//
//  CharactersListViewController.swift
//  InvioCase-RickandMorty
//
//  Created by Samed Dağlı on 22.03.2023.
//

import UIKit

final class CharacterListViewController: UIViewController {
    var viewModel: CharacterListViewModelProtocol!
    
    private var locations = [CharacterListPresentation]()
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        viewModel.load()
    }
}

extension CharacterListViewController: CharacterListViewDelegate {
    func handleOutput(_ output: CharacterListOutput) {
        switch output {
        case .startLoading:
            print("start loading")
        case .endLoading:
            print("end loading")
        case .updateLocations(let characterListPresentation):
            locations = characterListPresentation
            print(locations.count)
        }
    }
    
    func navigate(to route: CharacterListRoute) {
        
    }
}

//MARK: - UI Related
extension CharacterListViewController {
    private func layout() {
        configureView()
    }
    
    private func configureView() {
        view.backgroundColor = .systemBackground
    }
}

