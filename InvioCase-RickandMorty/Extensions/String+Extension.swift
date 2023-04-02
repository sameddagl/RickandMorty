//
//  String+Extension.swift
//  InvioCase-RickandMorty
//
//  Created by Samed Dağlı on 24.03.2023.
//

import Foundation

extension String {
    var formatDate: String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        let date = dateFormatterGet.date(from: self)!

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd MMM yyyy, HH:mm"
        
        return dateFormatterPrint.string(from: date)
    }
}
