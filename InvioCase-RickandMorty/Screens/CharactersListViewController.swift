//
//  CharactersListViewController.swift
//  InvioCase-RickandMorty
//
//  Created by Samed Dağlı on 22.03.2023.
//

import UIKit

final class CharactersListViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
}

//MARK: - UI Related
extension CharactersListViewController {
    private func layout() {
        configureView()
    }
    
    private func configureView() {
        view.backgroundColor = .systemBackground
    }
}

