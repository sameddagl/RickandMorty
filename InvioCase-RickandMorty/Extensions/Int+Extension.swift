//
//  Int+Extension.swift
//  InvioCase-RickandMorty
//
//  Created by Samed Dağlı on 23.03.2023.
//

import Foundation

extension Int {
    static func parse(from string: String) -> Int {
        return Int(string.components(separatedBy: CharacterSet.decimalDigits.inverted).joined())!
    }
}
