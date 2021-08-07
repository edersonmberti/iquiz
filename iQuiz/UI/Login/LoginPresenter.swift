//
//  LoginPresenter.swift
//  iQuiz
//
//  Created by Ederson Machado Berti on 07/08/21.
//

import Foundation

protocol LoginPresenterProtocol {}

class LoginPresenter {
    
    weak var view: LoginViewProtocol?
    
    init(view: LoginViewProtocol) {
        self.view = view
    }
}

extension LoginPresenter: LoginPresenterProtocol {}
