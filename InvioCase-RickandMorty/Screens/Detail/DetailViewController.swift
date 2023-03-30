//
//  DetailViewController.swift
//  InvioCase-RickandMorty
//
//  Created by Samed Dağlı on 24.03.2023.
//

import UIKit

final class DetailViewController: UIViewController {
    //MARK: - UI Elements
    private let scrollView = UIScrollView()
    private let containerView = UIView()
    
    private let characterImageView = UIImageView()
    private let statusLabel = RMBodyLabel()
    private let specyLabel = RMBodyLabel()
    private let genderLabel = RMBodyLabel()
    private let originLabel = RMBodyLabel()
    private let locationLabel = RMBodyLabel()
    private let createdAtLabel = RMBodyLabel()
    
    //MARK: - Properties
    var character: Character!

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        setInfos()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationBar()
    }
    
    //MARK: - Main Methods
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
        configureScrollView()
        configureImageView()
        configureLabels()
    }
    
    private func configureView() {
        view.backgroundColor = .systemBackground
    }
    
    private func setNavigationBar() {
        navigationItem.largeTitleDisplayMode = .never
    }
    
    private func configureScrollView() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.leading.bottom.trailing.equalTo(view)
        }
        
        scrollView.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.top.leading.bottom.trailing.equalTo(scrollView)
            make.width.equalTo(scrollView.snp.width)
        }
    }
    
    private func configureImageView() {
        containerView.addSubview(characterImageView)
        
        characterImageView.layer.cornerRadius = 10
        characterImageView.clipsToBounds = true
                
        characterImageView.snp.makeConstraints { make in
            make.top.equalTo(containerView.safeAreaLayoutGuide.snp.top).offset(20)
            make.height.equalTo(view.snp.width).offset(-100)
            make.leading.equalTo(view).offset(50)
            make.trailing.equalTo(view).offset(-50)
        }
    }
    
    private func configureLabels() {
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
        
        containerView.addSubview(mainStack)
        mainStack.snp.makeConstraints { make in
            make.top.equalTo(characterImageView.snp.bottom).offset(20)
            make.leading.equalTo(containerView.safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.lessThanOrEqualTo(containerView.safeAreaLayoutGuide.snp.trailing).offset(-20)
        }
                
        containerView.snp.makeConstraints { make in
            make.bottom.equalTo(mainStack.snp.bottom).offset(20)
        }
    }
}

