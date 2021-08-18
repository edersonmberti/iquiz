//
//  ViewCode.swift
//  iQuiz
//
//  Created by Ederson Machado Berti on 07/08/21.
//

import UIKit

protocol ViewCode: UIView {
    
    func setupHierarchy()
    func setupConstraints()
    func additionalSetup()
}

extension ViewCode {
    
    func setupLayout() {
        setupHierarchy()
        setupConstraints()
    }
    
    func additionalSetup() { }
}
