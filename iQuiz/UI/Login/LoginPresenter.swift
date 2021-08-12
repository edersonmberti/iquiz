//
//  LoginPresenter.swift
//  iQuiz
//
//  Created by Ederson Machado Berti on 07/08/21.
//

import Foundation

protocol LoginPresenterProtocol {
    
    var isValid: Bool { get }
    func dontHaveAccountTouched()
    func loginTouched()
    func updateEmail(with email: String)
    func updatePassword(with password: String)
}

class LoginPresenter {
    
    private var email: String?
    private var password: String?
    private let authService: AuthServiceProtocol
    
    
    weak var view: LoginViewProtocol?
    
    init(view: LoginViewProtocol, authService: AuthServiceProtocol = AuthService()) {
        self.view = view
        self.authService = authService
    }
}

extension LoginPresenter: LoginPresenterProtocol {
    
    var isValid: Bool {
        return email?.isEmpty == false
            && password?.isEmpty == false
    }
    
    func updateEmail(with email: String) {
        self.email = email
        
        view?.updateLayout()
    }
    
    func updatePassword(with password: String) {
        self.password = password
        
        view?.updateLayout()
    }
    
    func loginTouched() {
        guard let email = email?.lowercased() else { return }
        guard let password = password else { return }
        
        authService.signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                self.view?.updateLoginError(errorMessage: error.localizedDescription)
                return
            }
            
            self.view?.updateLoginSuccess()
        }
    }
    
    func dontHaveAccountTouched() {
        view?.redirectToRegistration()
    }
}
