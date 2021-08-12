//
//  RegistrationPresenter.swift
//  iQuiz
//
//  Created by Ederson Machado Berti on 08/08/21.
//

import Foundation

protocol RegistrationPresenterProtocol {
    
    func alreadyAccountTouched()
    func signUpTouched()
    func updateEmail(with email: String?)
    func updatePassword(with password: String?)
    func updateFullname(with fullname: String?)
}

class RegistrationPresenter {
    
    private let authService: AuthServiceProtocol
    weak var view: RegistrationViewProtocol?
    
    private var email: String?
    private var password: String?
    private var fullname: String?
    
    init(view: RegistrationViewProtocol, authService: AuthServiceProtocol = AuthService()) {
        self.authService = authService
        self.view = view
    }
}

extension RegistrationPresenter: RegistrationPresenterProtocol {
    
    func alreadyAccountTouched() {
        view?.redirectToLogin()
    }
    
    func signUpTouched() {
        guard let email = email else { return }
        guard let password = password else { return }
        guard let fullname = fullname else { return }
        
        let registrationData = Registration(email: email, password: password, fullname: fullname)
        
        authService.registerUser(with: registrationData, completion: { error in
            if let error = error {
                print("DEBUG: Failed to register user \(error.localizedDescription)")
                return
            }
            
            self.view?.redirectToMainTabBar()
        })
    }
    
    func updateEmail(with email: String?) {
        self.email = email
    }
    
    func updatePassword(with password: String?) {
        self.password = password
    }
    
    func updateFullname(with fullname: String?) {
        self.fullname = fullname
    }
}
