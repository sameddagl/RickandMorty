//
//  NSCollectionLayoutDimension+Extension.swift
//  InvioCase-RickandMorty
//
//  Created by Samed Dağlı on 24.03.2023.
//

import UIKit

extension NSCollectionLayoutDimension {
    
    static func fractionalWidth(forTargetSize size: CGFloat, inEnvironment environment: NSCollectionLayoutEnvironment) -> Self {
        let containerWidth = environment.container.effectiveContentSize.width
        let itemCount = containerWidth / size
        let fractionWidth: CGFloat = 1 / (itemCount.rounded())
        return Self.fractionalWidth(fractionWidth)
    }
}
