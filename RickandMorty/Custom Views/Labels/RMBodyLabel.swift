//
//  RMBodyLabel.swift
//  InvioCase-RickandMorty
//
//  Created by Samed Dağlı on 23.03.2023.
//

import UIKit

final class RMBodyLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    private func configure() {
        lineBreakMode = .byTruncatingTail
        numberOfLines = 1
        
        font = UIFont(name: "Avenir-Medium", size: 22)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
