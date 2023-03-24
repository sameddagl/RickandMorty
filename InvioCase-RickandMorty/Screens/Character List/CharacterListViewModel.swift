//
//  CharacterListViewModel.swift
//  InvioCase-RickandMorty
//
//  Created by Samed Dağlı on 22.03.2023.
//

import Foundation

final class CharacterListViewModel: CharacterListViewModelProtocol {
    weak var delegate: CharacterListViewDelegate?
    
    private let locationsService: LocationsServiceProtocol
    private let charactersService: CharactersServiceProtocol
    
    init(locationsService: LocationsServiceProtocol, charactersService: CharactersServiceProtocol) {
        self.locationsService = locationsService
        self.charactersService = charactersService
    }
    
    private var locations = [LocationResult]()
    private var characters = [Character]()
    private var currentPage = 1
    
    //MARK: - Main Methods
    func load() {
        notify(.startLoading)
        
        locationsService.getLocations(endPoint: .getLocations(page: currentPage)) { [weak self] result in
            guard let self = self else { return }
                        
            switch result {
            case .success(let location):
                let locationResults = location.results
                self.locations = locationResults
                self.notify(.updateLocations(self.locations.map{ LocationPresentation(locationResult: $0) }))
                
                //Network call to get characters
                let residentsIDs = self.parseIDs(from: self.locations[0])
                self.requestCharacters(residentsIDs: residentsIDs)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func selectLocation(location: String) {
        characters.removeAll()
        
        let selectedLocation = locations.first{ $0.name == location }
        
        guard let selectedLocation else { return } //Error handling
        
        let residentsIDs = parseIDs(from: selectedLocation)
        
        requestCharacters(residentsIDs: residentsIDs)
    }
    
    func select(at index: Int) {
        
    }
    
    //MARK: - Helper Methods
    private func requestCharacters(residentsIDs: [Int]) {
        if residentsIDs.count <= 1 {
            getSingleCharacter(residentsIDs: residentsIDs)
        }
        else {
            getMultipleCharacters(residentsIDs: residentsIDs)
        }
    }
    
    private func getMultipleCharacters(residentsIDs: [Int]) {
        self.charactersService.getCharacters(endPoint: CharactersEndPoint.getCharacters(ids: residentsIDs)) { [weak self] result in
            guard let self = self else { return }

            self.notify(.endLoading)
            switch result {
            case .success(let characters):
                self.characters.append(contentsOf: characters)
                self.notify(.updateCharacters(self.characters.map{ CharacterPresentation(character: $0) }))
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func getSingleCharacter(residentsIDs: [Int]) {
        self.charactersService.getCharacter(endPoint: CharactersEndPoint.getCharacters(ids: residentsIDs)) { [weak self] result in
            guard let self = self else { return }

            self.notify(.endLoading)
            switch result {
            case .success(let character):
                self.characters.append(character)
                self.notify(.updateCharacters(self.characters.map{ CharacterPresentation(character: $0) }))
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func parseIDs(from location: LocationResult) -> [Int] {
        var residentsID = [Int]()
        
        location.residents.forEach { residentURL in
            residentsID.append(Int.parse(from: residentURL))
        }
        
        return residentsID
    }
    
    private func notify(_ output: CharacterListOutput) {
        delegate?.handleOutput(output)
    }
}
