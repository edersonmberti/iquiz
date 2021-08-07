//
//  LoginView.swift
//  iQuiz
//
//  Created by Ederson Machado Berti on 07/08/21.
//

import UIKit

class LoginView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemRed
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginView: ViewCode {
    
    func buildViewHierarchy() {}
    
    func setupConstraints() {}
}
