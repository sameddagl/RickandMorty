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
        articleImageView.image = nil
    }
    
    func set(character: CharacterPresentation) {
        titleLabel.text = character.name
        articleImageView.sd_setImage(with: URL(string: character.image), placeholderImage: Images.placeholder)
    }
    
    private func configure() {
        backgroundColor = .secondarySystemBackground
        layer.cornerRadius = 10
        
        addSubview(articleImageView)
        articleImageView.layer.cornerRadius = 5
        articleImageView.layer.masksToBounds = true

        articleImageView.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.top.leading.trailing.equalTo(self)
            make.height.equalTo(self.snp.height).multipliedBy(0.8)
        }
        
        addSubview(titleLabel)
        titleLabel.textAlignment = .center
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(articleImageView)
            make.top.equalTo(articleImageView.snp.bottom).offset(5)
            make.leading.equalTo(self).offset(10)
            make.trailing.equalTo(self).offset(-10)
            make.bottom.equalTo(self).offset(-5)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
