//
//  AppContainer.swift
//  InvioCase-RickandMorty
//
//  Created by Samed Dağlı on 22.03.2023.
//

import Foundation

enum AppContainer {
    static let service = Service()
}

enum ServiceContainer {
    static let locationsService = LocationsService(service: AppContainer.service)
}
