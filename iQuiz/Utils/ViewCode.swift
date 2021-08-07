//
//  ViewCode.swift
//  iQuiz
//
//  Created by Ederson Machado Berti on 07/08/21.
//

import UIKit

protocol ViewCode: UIView {
    
    func buildViewHierarchy()
    func setupConstraints()
}

extension ViewCode {
    
    func setupLayout() {
        buildViewHierarchy()
        setupConstraints()
    }
}
