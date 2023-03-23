//
//  CharactersListViewController.swift
//  InvioCase-RickandMorty
//
//  Created by Samed Dağlı on 22.03.2023.
//

import UIKit

final class CharacterListViewController: UIViewController {
    //MARK: - UI Elements
    private var collectionView: UICollectionView!
    
    //MARK: - Injections
    var viewModel: CharacterListViewModelProtocol!
    
    //MARK: - Properties
    private var locations = [LocationPresentation]()
    private var characters = [CharacterPresentation]()
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        viewModel.load()
    }
}

//MARK: - View Model Outputs
extension CharacterListViewController: CharacterListViewDelegate {
    func handleOutput(_ output: CharacterListOutput) {
        switch output {
        case .startLoading:
            print("start loading")
        case .endLoading:
            print("end loading")
        case .updateLocations(let locationPresentation):
            locations = locationPresentation
            print(locations.count)
        case .updateCharacters(let charactersPresentation):
            characters = charactersPresentation
            collectionView.reloadOnMainThread()
            print(characters.count)
        }
    }
    
    func navigate(to route: CharacterListRoute) {
        
    }
}

extension CharacterListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCell.reuseID, for: indexPath) as! CharacterCell
        cell.set(character: characters[indexPath.item])
        return cell
    }
}

//MARK: - UI Related
extension CharacterListViewController {
    private func layout() {
        configureView()
        createCollectionView()
    }
    
    private func configureView() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Rick and Morty"
    }
    
    private func createCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCollectionViewLayout())
        collectionView.register(CharacterCell.self, forCellWithReuseIdentifier: CharacterCell.reuseID)
        collectionView.dataSource = self
        view.addSubview(collectionView)
    }
    
    private func createCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout{ sectionNum, env in
            let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1)))
            item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10)
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(210)), subitems: [item])
            group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 10, trailing: 10)
            let section = NSCollectionLayoutSection(group: group)
            return section
        }
        
        return layout
    }
}


