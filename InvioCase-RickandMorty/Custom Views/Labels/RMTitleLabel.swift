//
//  RMTitleLabel.swift
//  InvioCase-RickandMorty
//
//  Created by Samed Dağlı on 23.03.2023.
//

import UIKit

final class RMTitleLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    private func configure() {
        lineBreakMode = .byTruncatingTail
        numberOfLines = 2
        
        font = UIFont(name: "AvenirNext-Bold", size: 22)
        
        self.adjustsFontSizeToFitWidth = true
        self.minimumScaleFactor = 0.95
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

