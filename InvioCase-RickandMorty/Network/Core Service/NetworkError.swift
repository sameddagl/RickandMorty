//
//  NetworkError.swift
//  InvioCase-RickandMorty
//
//  Created by Samed Dağlı on 22.03.2023.
//

import Foundation

enum NetworkError: String, Error {
    case badURL
    case badResponse
    case unauthorized
    case unexpectedStatusCode
    case badData
    case decoding
}
