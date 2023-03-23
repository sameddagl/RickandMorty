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
    
    init(locationsService: LocationsServiceProtocol) {
        self.locationsService = locationsService
    }
    
    private var locations = [LocationResult]()
    private var currentPage = 1
    
    func load() {
        notify(.startLoading)
        locationsService.getLocations(endPoint: .getLocations(page: currentPage)) { [weak self] result in
            guard let self = self else { return }
            
            self.notify(.endLoading)
            
            switch result {
            case .success(let location):
                let locationResults = location.results
                self.locations = locationResults
                
                self.notify(.updateLocations(self.locations.map{ CharacterListPresentation(locationResult: $0) }))
                
                let residentsID = self.parseIDs(from: locationResults[0])

                //Network call to get characters
                self.notify(.updateCharacters(residentsID))
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func selectLocation(location: String) {
        let selectedLocation = locations.first{ $0.name == location }
        
        guard let selectedLocation else { return } //Error handling
        
        let residentsIDs = parseIDs(from: selectedLocation)
        
        //Network call to get characters
    }
    
    func select(at index: Int) {
        
    }
    
    private func parseIDs(from location: LocationResult) -> [Int] {
        var residentsID = [Int]()

        location.residents.forEach { residentURL in
            residentsID.append(Int.parse(from: residentURL))
        }
        
        return residentsID
    }
    
    //MARK: - Helper Methods
    private func notify(_ output: CharacterListOutput) {
        delegate?.handleOutput(output)
    }
}
