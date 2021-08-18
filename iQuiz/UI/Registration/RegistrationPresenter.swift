//
//  RegistrationPresenter.swift
//  iQuiz
//
//  Created by Ederson Machado Berti on 08/08/21.
//

import Foundation

protocol RegistrationPresenterProtocol {
    
    var isValid: Bool { get }
    func alreadyAccount()
    func signUp()
    func updateFormValue(email: String?)
    func updateFormValue(password: String?)
    func updateFormValue(fullname: String?)
}

class RegistrationPresenter {
    
    private let authService: AuthServiceProtocol
    private weak var view: RegistrationViewProtocol?
    
    private var email: String?
    private var password: String?
    private var fullname: String?
    
    init(view: RegistrationViewProtocol, authService: AuthServiceProtocol = AuthService()) {
        self.authService = authService
        self.view = view
    }
}

extension RegistrationPresenter: RegistrationPresenterProtocol {
    
    var isValid: Bool {
        return email?.isEmpty == false
            && password?.isEmpty == false
            && fullname?.isEmpty == false
    }
    
    func alreadyAccount() {
        view?.redirectToLogin()
    }
    
    func signUp() {
        guard let email = email else { return }
        guard let password = password else { return }
        guard let fullname = fullname else { return }
        
        view?.updateRegistrationLoading()
        
        let registrationData = Registration(email: email, password: password, fullname: fullname)
        
        authService.registerUser(with: registrationData, completion: { error in
            if let error = error {
                self.view?.updateRegistrationError(errorMessage: error.localizedDescription)
                print("DEBUG: Failed to register user \(error.localizedDescription)")
                return
            }
            
            self.view?.updateRegistrationSuccess()
        })
    }
    
    func updateFormValue(email: String?) {
        self.email = email
        view?.updateLayout()
    }
    
    func updateFormValue(password: String?) {
        self.password = password
        view?.updateLayout()
    }
    
    func updateFormValue(fullname: String?) {
        self.fullname = fullname
        view?.updateLayout()
    }
}
