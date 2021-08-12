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
        backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        setTitle(placeholder, for: .normal)
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    }
}
