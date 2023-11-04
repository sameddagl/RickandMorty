//
//  LocationCell.swift
//  InvioCase-RickandMorty
//
//  Created by Samed Dağlı on 24.03.2023.
//

import UIKit

final class LocationCell: UICollectionViewCell {
    static let reuseID = "LocationCell"
    
    private let titleLabel = RMCellLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    override func prepareForReuse() {
        titleLabel.text = ""
    }
    
    func set(location: LocationPresentation) {
        titleLabel.text = location.name
        titleLabel.textColor = location.isSelected ? .systemGreen : .label
    }

    private func configure() {
        backgroundColor = .secondarySystemBackground
        layer.cornerRadius = 10

        addSubview(titleLabel)
        titleLabel.textAlignment = .center
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self)
            make.leading.equalTo(self).offset(5)
            make.trailing.equalTo(self).offset(-5)
            make.bottom.equalTo(self)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
