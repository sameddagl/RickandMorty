//
//  UserDefaults+Extension.swift
//  InvioCase-RickandMorty
//
//  Created by Samed Dağlı on 25.03.2023.
//

import Foundation

extension UserDefaults {
    
    var hasOpenedBefore: Bool {
        get {
            return UserDefaults.standard.bool(forKey: "hasOpenedBefore")
        }
        
        set{
            UserDefaults.standard.set(newValue, forKey: "hasOpenedBefore")
        }
    }
}
