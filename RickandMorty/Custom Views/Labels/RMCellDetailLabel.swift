//
//  RMCellDetailLabel.swift
//  InvioCase-RickandMorty
//
//  Created by Samed Dağlı on 24.03.2023.
//

import UIKit

final class RMCellDetailLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    private func configure() {
        lineBreakMode = .byTruncatingTail
        numberOfLines = 1
        
        font = .systemFont(ofSize: 14)
        textColor = .secondaryLabel
        
        self.adjustsFontSizeToFitWidth = true
        self.minimumScaleFactor = 0.90
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
