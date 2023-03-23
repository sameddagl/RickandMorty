//
//  CharacterCell.swift
//  InvioCase-RickandMorty
//
//  Created by Samed Dağlı on 23.03.2023.
//

import UIKit

final class CharacterCell: UICollectionViewCell {
    static let reuseID = "CharacterCell"
    
    private let articleImageView = UIImageView()
    private let titleLabel = RMCellLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    override func prepareForReuse() {
        titleLabel.text = ""
    }
    
    func set(character: CharacterPresentation) {
        titleLabel.text = character.name
    }
    
    private func configure() {
        addSubview(articleImageView)
        articleImageView.image = Images.placeholder

        articleImageView.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.top.equalTo(self).offset(10)
            make.leading.equalTo(self).offset(10)
            make.trailing.equalTo(self).offset(-10)
            make.height.equalTo(articleImageView.snp.width).multipliedBy(0.8)
        }
        
        addSubview(titleLabel)
        titleLabel.textAlignment = .center
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(articleImageView)
            make.top.equalTo(articleImageView.snp.bottom).offset(10)
            make.leading.equalTo(self).offset(10)
            make.trailing.equalTo(self).offset(-10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
