//
//  AlertPresentable.swift
//  InvioCase-RickandMorty
//
//  Created by Samed Dağlı on 27.10.2023.
//

import UIKit

protocol AlertPresentable {
    func showAlert(title: String, message: String, okAction: @escaping (() -> Void))
    func showDismissableAlert(title: String, message: String, okAction: @escaping (() -> Void))
}

extension AlertPresentable where Self: UIViewController {
    func showAlert(title: String, message: String, okAction: @escaping (() -> Void)) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okayAction = UIAlertAction(title: "Okay", style: .default) { _ in
                okAction()
            }
            alert.addAction(okayAction)
            self.present(alert, animated: true)
        }
    }
    
    func showDismissableAlert(title: String, message: String, okAction: @escaping (() -> Void)) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okayAction = UIAlertAction(title: "Okay", style: .default)
            alert.addAction(okayAction)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(cancelAction)
            
            self.present(alert, animated: true)
        }
    }
}
