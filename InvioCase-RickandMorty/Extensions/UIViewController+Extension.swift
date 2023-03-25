//
//  UIViewController+Extension.swift
//  InvioCase-RickandMorty
//
//  Created by Samed Dağlı on 25.03.2023.
//

import UIKit

extension UIViewController {
    func showAlert(title: String? = "Error", message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Okay", style: .default)
        alert.addAction(cancelAction)
        
        DispatchQueue.main.async {
            self.present(alert, animated: true)
        }
    }
}
