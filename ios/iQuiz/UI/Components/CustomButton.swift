//
//  CustomButton.swift
//  iQuiz
//
//  Created by Ederson Machado Berti on 08/08/21.
//

import UIKit

class CustomButton: UIButton {
    
    init(placeholder: String) {
        super.init(frame: .zero)
        
        setupLayout(placeholder: placeholder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout(placeholder: String) {
        setHeight(50)
        backgroundColor = Colors.blue
        setTitle(placeholder, for: .normal)
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 10
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    }
}
