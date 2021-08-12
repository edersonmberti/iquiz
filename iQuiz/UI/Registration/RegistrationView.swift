//
//  RegistrationView.swift
//  iQuiz
//
//  Created by Ederson Machado Berti on 08/08/21.
//

import UIKit

class RegistrationView: UIView {
    
    let emailTextField: CustomTextField = {
        $0.keyboardType = .emailAddress
        return $0
    }(CustomTextField(placeholder: "E-mail"))
    
    let passwordTextField: CustomTextField = {
        $0.isSecureTextEntry = true
        return $0
    }(CustomTextField(placeholder: "Password"))
    
    let fullnameTextField: CustomTextField = CustomTextField(placeholder: "Fullname")
    
    let signUpButton: CustomButton = CustomButton(placeholder: "Sing Up")
    
    let alreadyAccountButton: UIButton = {
        $0.attributedTitle(firstPart: "Already have an account?", secondPart: "Sing In")
        return $0
    }(UIButton(type: .system))
    
    lazy var formStack = UIStackView(arrangedSubviews: [emailTextField,
                                                        passwordTextField,
                                                        fullnameTextField,
                                                        signUpButton])
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemTeal
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RegistrationView: ViewCode {
    
    func buildViewHierarchy() {
        addSubview(formStack)
        addSubview(alreadyAccountButton)
    }
    
    func setupConstraints() {
        formStack.axis = .vertical
        formStack.spacing = 20
        formStack.anchor(
            top: safeAreaLayoutGuide.topAnchor,
            left: leftAnchor,
            right: rightAnchor,
            paddingTop: 50,
            paddingLeft: 32,
            paddingRight: 32
        )
        
        alreadyAccountButton.centerX(inView: self)
        alreadyAccountButton.anchor(bottom: safeAreaLayoutGuide.bottomAnchor, paddingBottom: 16)
    }
}
