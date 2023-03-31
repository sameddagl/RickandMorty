//
//  CharacterListViewModel.swift
//  InvioCase-RickandMorty
//
//  Created by Samed Dağlı on 22.03.2023.
//

import Foundation

final class CharacterListViewModel: CharacterListViewModelProtocol {
    weak var delegate: CharacterListViewDelegate?
    
    //MARK: - Injections
    private let locationsService: LocationsServiceProtocol
    private let charactersService: CharactersServiceProtocol
    
    init(locationsService: LocationsServiceProtocol, charactersService: CharactersServiceProtocol) {
        self.locationsService = locationsService
        self.charactersService = charactersService
    }
    
    //MARK: - Properties
    private var locations = [LocationResult]()
    private var characters = [Character]()
    private var currentPage = 1
    
    //MARK: - Main Methods
    func load() {
        notify(.startLoading)
        
        //Network call to get locations
        locationsService.getLocations(endPoint: .getLocations(page: currentPage)) { [weak self] result in
            guard let self = self else { return }
                        
            switch result {
            case .success(let location):
                let locationResults = location.results
                self.locations.append(contentsOf: locationResults)
                
                var locationsPresentation = self.locations.map{ LocationPresentation(locationResult: $0) }
                locationsPresentation[0].isSelected = true
                self.notify(.updateLocations(locationsPresentation))
                
                //Network call to get characters
                let residentsIDs = self.parseIDs(from: self.locations[0])
                
                guard residentsIDs.count > 0 else {
                    self.emptyState(location: self.locations[0])
                    return
                }
                
                self.requestCharacters(residentsIDs: residentsIDs)
            case .failure(let error):
                print("error")
                self.notify(.failWithError(error))
            }
        }
    }
    
    func selectLocation(at index: Int) {
        notify(.startLoading)
                        
        let selectedLocation = locations.first{ $0.name == locations[index].name }!
        
        let residentsIDs = parseIDs(from: selectedLocation)
        
        guard residentsIDs.count > 0 else {
            print("no one")
            self.emptyState(location: selectedLocation)
            return
        }
                
        characters.removeAll()
        
        selectLocationCell(at: index)
        
        requestCharacters(residentsIDs: residentsIDs)
    }

    func selectCharacter(at index: Int) {
        let selectedCharacter = characters[index]
        delegate?.navigate(to: .detail(selectedCharacter))
    }
    
    //MARK: - Helper Methods
    private func requestCharacters(residentsIDs: String) {
        if residentsIDs.count <= 2 {
            getSingleCharacter(residentsIDs: residentsIDs)
        }
        else {
            getMultipleCharacters(residentsIDs: residentsIDs)
        }
    }
    
    private func getMultipleCharacters(residentsIDs: String) {
        self.charactersService.getCharacters(endPoint: CharactersEndPoint.getCharacters(ids: residentsIDs)) { [weak self] result in
            guard let self = self else { return }

            self.notify(.endLoading)
            switch result {
            case .success(let characters):
                self.characters.append(contentsOf: characters)
                self.notify(.updateCharacters(self.characters.map{ CharacterPresentation(character: $0) }))
            case .failure(let error):
                self.notify(.failWithError(error))
            }
        }
    }
    
    private func getSingleCharacter(residentsIDs: String) {
        self.charactersService.getCharacter(endPoint: CharactersEndPoint.getCharacters(ids: residentsIDs)) { [weak self] result in
            guard let self = self else { return }

            self.notify(.endLoading)
            switch result {
            case .success(let character):
                self.characters.append(character)
                self.notify(.updateCharacters(self.characters.map{ CharacterPresentation(character: $0) }))
            case .failure(let error):
                self.notify(.failWithError(error))
            }
        }
    }
    
    private func parseIDs(from location: LocationResult) -> String {
        var residentsID = [Int]()
        
        location.residents.forEach { residentURL in
            residentsID.append(Int.parse(from: residentURL))
        }
        
        let stringIDs = residentsID.compactMap{ String($0) }.joined(separator: ",")

        return stringIDs
    }
    
    private func selectLocationCell(at index: Int) {
        var locationsPresentation = self.locations.map{ LocationPresentation(locationResult: $0) }
        
        for (index, _) in locationsPresentation.enumerated() {
            locationsPresentation[index].isSelected = false
        }
        locationsPresentation[index].isSelected = true
        
        notify(.updateLocations(locationsPresentation))
    }
    
    private func emptyState(location: LocationResult) {
        self.notify(.endLoading)
        self.notify(.showEmptyState(message: "No character found on \(location.name)"))
    }
    
    private func notify(_ output: CharacterListOutput) {
        delegate?.handleOutput(output)
    }
}
