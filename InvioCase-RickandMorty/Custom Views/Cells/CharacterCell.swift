//
//  CharacterCell.swift
//  InvioCase-RickandMorty
//
//  Created by Samed Dağlı on 23.03.2023.
//

import UIKit
import SDWebImage

final class CharacterCell: UICollectionViewCell {
    static let reuseID = "CharacterCell"
    
    private let characterImageView = RMCellImageView(frame: .zero)
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
        characterImageView.image = nil
    }
    
    func set(character: CharacterPresentation) {
        titleLabel.text = character.name
        genderLabel.text = character.gender.capitalized
        genderIndicator.tintColor = getGenderIndicatorColor(gender: character.gender.capitalized)
        
        characterImageView.sd_imageIndicator = SDWebImageActivityIndicator.medium
        characterImageView.sd_imageTransition = .fade
        characterImageView.sd_setImage(with: URL(string: character.image), placeholderImage: Images.placeholder)
    }
    
    private func configure() {
        backgroundColor = .secondarySystemBackground
        layer.cornerRadius = 10
        configureGenderStack()
        configureTitleLabel()
        configureCharacterImageView()
    }
    
    private func configureGenderStack() {
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
    }
    
    private func configureTitleLabel() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(self).offset(10)
            make.trailing.equalTo(self).offset(-10)
            make.bottom.equalTo(genderLabel.snp.top).offset(-5)
        }
    }
    
    private func configureCharacterImageView() {
        addSubview(characterImageView)
        characterImageView.layer.cornerRadius = 5
        characterImageView.layer.masksToBounds = true

        characterImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(self)
            make.bottom.equalTo(titleLabel.snp.top).offset(-10)
        }
    }
    
    private func getGenderIndicatorColor(gender: String) -> UIColor {
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
            return .clear
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
