//
//  LoginView.swift
//  iQuiz
//
//  Created by Ederson Machado Berti on 07/08/21.
//

import UIKit

class LoginView: UIView {
    
    let emailTextField: CustomTextField = {
        $0.keyboardType = .emailAddress
        return $0
    }(CustomTextField(placeholder: "E-mail"))
    
    let passwordTextField: CustomTextField = {
        $0.isSecureTextEntry = true
        return $0
    }(CustomTextField(placeholder: "Password"))
    
    let loginButton: CustomButton = {
        $0.isEnabled = false
        return $0
    }(CustomButton(placeholder: "Log In"))
    
    let dontHaveAccountButton: UIButton = {
        $0.attributedTitle(firstPart: "Don't have an account?", secondPart: "Sing Up")
        return $0
    }(UIButton(type: .system))
    
    lazy var formStack = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, loginButton])
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = Colors.background
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginView: ViewCode {
    
    func buildViewHierarchy() {
        addSubview(formStack)
        addSubview(dontHaveAccountButton)
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
        
        dontHaveAccountButton.centerX(inView: self)
        dontHaveAccountButton.anchor(bottom: safeAreaLayoutGuide.bottomAnchor, paddingBottom: 16)
    }
}
