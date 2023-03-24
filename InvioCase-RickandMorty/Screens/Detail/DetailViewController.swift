//
//  DetailViewController.swift
//  InvioCase-RickandMorty
//
//  Created by Samed Dağlı on 24.03.2023.
//

import UIKit

final class DetailViewController: RMDataLoadingVC {
    //MARK: - UI Elements
    private var characterImageView = UIImageView()
    private var statusLabel = RMBodyLabel()
    private var specyLabel = RMBodyLabel()
    private var genderLabel = RMBodyLabel()
    private var originLabel = RMBodyLabel()
    private var locationLabel = RMBodyLabel()
    private var createdAtLabel = RMBodyLabel()
    
    //MARK: - Properties
    var character: Character!

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        setInfos()
    }
    
    private func setInfos() {
        title = character.name
        characterImageView.sd_setImage(with: URL(string: character.image), placeholderImage: Images.placeholder)
        statusLabel.text = character.status
        specyLabel.text = character.species
        genderLabel.text = character.gender
        originLabel.text = character.origin.name
        locationLabel.text = character.location.name
        createdAtLabel.text = character.created.formatDate
    }
}

//MARK: - UI Related
extension DetailViewController {
    private func layout() {
        configureView()
        configureImageView()
        configureTitleLabels()
    }
    
    private func configureView() {
        navigationController?.navigationBar.prefersLargeTitles = false
        view.backgroundColor = .systemBackground
    }
    
    private func configureImageView() {
        view.addSubview(characterImageView)
                
        characterImageView.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.width.height.equalTo(275)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
//            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(50)
//            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-50)
        }
    }
    
    private func configureTitleLabels() {
        let statusTitleLabel = RMTitleLabel()
        statusTitleLabel.text = "Status:"
        
        let specyTitleLabel = RMTitleLabel()
        specyTitleLabel.text = "Specy:"
        
        let genderTitleLabel = RMTitleLabel()
        genderTitleLabel.text = "Gender:"
        
        let originTitleLabel = RMTitleLabel()
        originTitleLabel.text = "Origin:"
        
        let locationTitleLabel = RMTitleLabel()
        locationTitleLabel.text = "Location:"
        
        let createdAtTitleLabel = RMTitleLabel()
        createdAtTitleLabel.text = "Created at:"
        
        let titleLabelsStack = UIStackView(arrangedSubviews: [statusTitleLabel, specyTitleLabel, genderTitleLabel, originTitleLabel, locationTitleLabel, createdAtTitleLabel])
        titleLabelsStack.axis = .vertical
        titleLabelsStack.spacing = 5
        titleLabelsStack.distribution = .fillEqually
                
        let labelsStack = UIStackView(arrangedSubviews: [statusLabel, specyLabel, genderLabel, originLabel, locationLabel, createdAtLabel])
        labelsStack.axis = .vertical
        labelsStack.spacing = 5
        labelsStack.distribution = .fillEqually
        
        let mainStack = UIStackView(arrangedSubviews: [titleLabelsStack, labelsStack])
        mainStack.spacing = 20
        mainStack.distribution = .fillProportionally
        
        view.addSubview(mainStack)
        mainStack.snp.makeConstraints { make in
            make.top.equalTo(characterImageView.snp.bottom).offset(20)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.lessThanOrEqualTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
        }
    }
}

