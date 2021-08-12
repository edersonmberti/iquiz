//
//  FakeLaunchScreenPresenter.swift
//  iQuiz
//
//  Created by Ederson Machado Berti on 07/08/21.
//

import Foundation

protocol FakeLaunchScreenPresenterProtocol {
    
    func checkUserAlreadyAuthenticated()
}

class FakeLaunchScreenPresenter {
    
    private let authService: AuthServiceProtocol
    weak var view: FakeLaunchScreenViewProtocol?
    
    init(view: FakeLaunchScreenViewProtocol, authService: AuthServiceProtocol = AuthService()) {
        self.authService = authService
        self.view = view
    }
}

extension FakeLaunchScreenPresenter: FakeLaunchScreenPresenterProtocol {
    
    func checkUserAlreadyAuthenticated() {
        let isAuthenticated = authService.isAuthenticated()
        self.view?.redirectUser(isAuthenticated: isAuthenticated)
    }
}
