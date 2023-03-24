//
//  CharacterCell.swift
//  InvioCase-RickandMorty
//
//  Created by Samed Dağlı on 23.03.2023.
//

import UIKit

enum Gender: String {
    case male = "Male"
    case female = "Female"
    case genderless = "Genderless"
    case unknown = "Unknown"
}

final class CharacterCell: UICollectionViewCell {
    static let reuseID = "CharacterCell"
    
    private let articleImageView = RMCellImageView(frame: .zero)
    private let titleLabel = RMCellLabel()
    private let genderIndicator = UIImageView()
    private let genderLabel = RMCellDetailLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    override func prepareForReuse() {
        titleLabel.text = ""
        genderLabel.text = ""
        articleImageView.image = nil
    }
    
    func set(character: CharacterPresentation) {
        titleLabel.text = character.name
        genderLabel.text = character.gender.capitalized
        genderIndicator.tintColor = setGenderIndicatorColor(gender: character.gender.capitalized)
        articleImageView.sd_setImage(with: URL(string: character.image), placeholderImage: Images.placeholder)
    }
    
    private func configure() {
        backgroundColor = .secondarySystemBackground
        layer.cornerRadius = 10
        
        genderIndicator.image = SFSymbols.circle
        genderIndicator.snp.makeConstraints { make in
            make.width.height.equalTo(12)
        }
        
        let stack = UIStackView(arrangedSubviews: [genderIndicator, genderLabel])
        stack.distribution = .fill
        stack.spacing = 5
        addSubview(stack)
        
        stack.snp.makeConstraints { make in
            make.leading.equalTo(self).offset(10)
            make.trailing.equalTo(self).offset(-10)
            make.bottom.equalTo(self).offset(-5)
        }
        
        addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(self).offset(10)
            make.trailing.equalTo(self).offset(-10)
            make.bottom.equalTo(genderLabel.snp.top).offset(-5)
        }
        
        addSubview(articleImageView)
        articleImageView.layer.cornerRadius = 5
        articleImageView.layer.masksToBounds = true

        articleImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(self)
            make.bottom.equalTo(titleLabel.snp.top).offset(-10)
        }
    }
    
    private func setGenderIndicatorColor(gender: String) -> UIColor{
        switch gender {
        case "Male":
            return .systemBlue
        case "Female":
            return .systemPink
        case "Unknown":
            return .black
        case "Genderless":
            return .systemPurple
        default:
            return .link
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
