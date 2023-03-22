//
//  LocationsService.swift
//  InvioCase-RickandMorty
//
//  Created by Samed Dağlı on 22.03.2023.
//

import Foundation

protocol LocationsServiceProtocol {
    func getLocations(endPoint: LocationsEndPoint, completion: @escaping (Result<Location, NetworkError>) -> Void)
}

final class LocationsService {
    private var service: ServiceProtocol
    
    init(service: ServiceProtocol) {
        self.service = service
    }
    
    func getLocations(endPoint: LocationsEndPoint, completion: @escaping (Result<Location, NetworkError>) -> Void) {
        service.fetch(endPoint: endPoint) { (result: Result<Location, NetworkError>) in
            completion(result)
        }
    }
}
