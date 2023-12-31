//
//  CharactersListViewController.swift
//  InvioCase-RickandMorty
//
//  Created by Samed Dağlı on 22.03.2023.
//

import UIKit

final class CharacterListViewController: RMDataLoadingVC, AlertPresentable {
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        viewModel.viewDidLayoutSubviews()
    }
}

//MARK: - View Model Outputs
extension CharacterListViewController: CharacterListViewDelegate {
    func handleOutput(_ output: CharacterListOutput) {
        switch output {
        case .startLoading:
            showLoadingScreen()
        case .endLoading:
            removeLoadingScreen()
        case .updateLocations(let locationPresentation):
            locations = locationPresentation
        case .updateCharacters(let charactersPresentation):
            characters = charactersPresentation
            collectionView.reloadOnMainThread()
        case .scrollToSelectedLocation(let indexPath):
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        case .failWithError(let error):
            showAlert(title: "Error", message: error.rawValue, okAction: {})
        case .showEmptyState(let message):
            showAlert(title:"No one around here" ,message: message, okAction: {})
        }
    }
    
    func navigate(to route: CharacterListRoute) {
        switch route {
        case .detail(let character):
            let vc = DetailViewBuilder.build(character: character)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

//MARK: - Collection View Delegate & Data Source
extension CharacterListViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return locations.count
        }
        else {
            return characters.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LocationCell.reuseID, for: indexPath) as! LocationCell
            cell.set(location: locations[indexPath.item])
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCell.reuseID, for: indexPath) as! CharacterCell
            cell.set(character: characters[indexPath.item])
            return cell
        }
    }
}

extension CharacterListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            viewModel.selectLocation(at: indexPath.item)
        }
        else {
            viewModel.selectCharacter(at: indexPath.item)
        }
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
        title = "Rick and Morty"
    }
    
    private func setNavigationBar() {
        navigationItem.largeTitleDisplayMode =  .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func createCollectionView() {
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: createCollectionViewLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.register(CharacterCell.self, forCellWithReuseIdentifier: CharacterCell.reuseID)
        collectionView.register(LocationCell.self, forCellWithReuseIdentifier: LocationCell.reuseID)
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)        
    }
    
    private func createCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout{ sectionNum, env in
            if sectionNum == 0 {
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5)
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.45), heightDimension: .absolute(50)), subitems: [item])
                group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 10, trailing: 5)
                
                section.orthogonalScrollingBehavior = .continuous
                
                return section
            }
            else {
                let fractionWidth = NSCollectionLayoutDimension.fractionalWidth(forTargetSize: 200, inEnvironment: env)
                
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: fractionWidth, heightDimension: .fractionalHeight(1)))
                item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(260)), subitems: [item])
                group.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
                
                let section = NSCollectionLayoutSection(group: group)
                return section
            }
        }
        return layout
    }
}


