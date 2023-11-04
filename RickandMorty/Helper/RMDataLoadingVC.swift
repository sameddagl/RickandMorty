//
//  RMDataLoadingVC.swift
//  InvioCase-RickandMorty
//
//  Created by Samed Dağlı on 24.03.2023.
//

import UIKit

class RMDataLoadingVC: UIViewController {
    private var container: UIView!
    
    func showLoadingScreen() {
        container = UIView()
        
        view.addSubview(container)
        container.backgroundColor = .systemGray3.withAlphaComponent(0.2)
        
        container.snp.makeConstraints { make in
            make.top.leading.bottom.trailing.equalTo(view)
        }
        
        let spinner = UIActivityIndicatorView(style: .medium)
        spinner.color = .systemGreen
        
        container.addSubview(spinner)
        
        spinner.snp.makeConstraints { make in
            make.center.equalTo(view)
        }
        
        spinner.startAnimating()
    }
    
    func removeLoadingScreen() {
        DispatchQueue.main.async {
            self.container.removeFromSuperview()
            self.container = nil
        }
    }
}
