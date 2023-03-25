//
//  SplashScreen.swift
//  InvioCase-RickandMorty
//
//  Created by Samed Dağlı on 24.03.2023.
//

import UIKit

final class SplashScreen: UIViewController {
    //MARK: - UI Properties
    private var logoImageView = UIImageView()
    private var titleLabel = RMTitleLabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let vc = UINavigationController(rootViewController: CharacterListViewBuilder.build())
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }
}

//MARK: - UI Related
extension SplashScreen {
    private func layout() {
        configureView()
        configure()
    }
    
    private func configureView() {
        view.backgroundColor = .systemBackground
    }
    
    private func configure() {
        view.addSubview(logoImageView)
        logoImageView.image = Images.splashImage
        
        logoImageView.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.centerY.equalTo(view).offset(-20)
            make.width.height.equalTo(view.snp.width).multipliedBy(0.7)
        }
        
        view.addSubview(titleLabel)
        titleLabel.textAlignment = .center
        
        if UserDefaults.standard.hasOpenedBefore {
            titleLabel.text = "Hello!"
        }
        else {
            titleLabel.text = "Welcome!"
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(10)
            make.leading.equalTo(view).offset(30)
            make.trailing.equalTo(view).offset(-30)
        }
    }
}

