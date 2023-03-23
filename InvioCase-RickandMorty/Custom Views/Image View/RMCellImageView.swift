//
//  RMCellImageView.swift
//  InvioCase-RickandMorty
//
//  Created by Samed Dağlı on 23.03.2023.
//

import UIKit

final class RMCellImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    private func configure() {
        clipsToBounds = true
        layer.cornerRadius = 20
        
        backgroundColor = .systemBackground
        tintColor = .secondarySystemFill
        
        contentMode = .scaleAspectFill
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
