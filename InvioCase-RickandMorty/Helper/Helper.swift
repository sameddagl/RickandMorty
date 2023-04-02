//
//  Helper.swift
//  InvioCase-RickandMorty
//
//  Created by Samed Dağlı on 2.04.2023.
//

import Foundation

struct Helper {
    static func parseInts(from stringArray: [String]) -> String {
        var parsedInts = [String]()
        
        stringArray.forEach { intValue in
            parsedInts.append(intValue.components(separatedBy: CharacterSet.decimalDigits.inverted).joined())
        }
        
        let stringIDs = parsedInts.compactMap{ String($0) }.joined(separator: ",")

        return stringIDs
    }
}
