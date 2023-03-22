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
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func select(at index: Int) {
        
    }
    
    //MARK: - Helper Methods
    private func notify(_ output: CharacterListOutput) {
        delegate?.handleOutput(output)
    }
}
