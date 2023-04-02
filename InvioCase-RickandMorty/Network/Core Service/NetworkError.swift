//
//  NetworkError.swift
//  InvioCase-RickandMorty
//
//  Created by Samed Dağlı on 22.03.2023.
//

import Foundation

enum NetworkError: String, Error {
    case badURL                 = "Unable to complete your request. Please check your internet connection"
    case invalidResponse        = "Invalid response"
    case unauthorized           = "Unauthorized"
    case unexpectedStatusCode   = "Unexpected Status Code"
    case invalidData            = "The data received from the server was invalid. Please try again."
    case decoding               = "Decoding error"
    
}
