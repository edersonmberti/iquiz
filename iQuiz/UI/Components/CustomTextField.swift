//
//  CustomTextField.swift
//  iQuiz
//
//  Created by Ederson Machado Berti on 08/08/21.
//

import UIKit

class CustomTextField: UITextField {
    
    init(placeholder: String) {
        super.init(frame: .zero)
        
        setupLayout(placeholder: placeholder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout(placeholder: String) {
        let spacer = UIView()
        spacer.setDimensions(height: 50, width: 12)
        setHeight(50)
        leftView = spacer
        leftViewMode = .always
        borderStyle = .none
        layer.cornerRadius = 10
        textColor = Colors.textPrimary
        backgroundColor = Colors.surface
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [.foregroundColor: Colors.textPrimary])
    }
}
