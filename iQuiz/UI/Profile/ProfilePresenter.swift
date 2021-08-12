//
//  ProfilePresenter.swift
//  iQuiz
//
//  Created by Ederson Machado Berti on 09/08/21.
//

import Foundation

protocol ProfilePresenterProtocol {
    
    func signOutTouched()
}

class ProfilePresenter {
    
    private let authService: AuthServiceProtocol
    weak var view: ProfileViewProtocol?
    
    init(view: ProfileViewProtocol, authService: AuthServiceProtocol = AuthService()) {
        self.authService = authService
        self.view = view
    }
}

extension ProfilePresenter: ProfilePresenterProtocol {
    
    func signOutTouched() {
        authService.signOut()
        
        view?.redirectToSignIn()
    }
}
