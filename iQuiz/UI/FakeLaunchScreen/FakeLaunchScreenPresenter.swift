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
    
    weak var view: FakeLaunchScreenViewProtocol?
    
    init(view: FakeLaunchScreenViewProtocol) {
        self.view = view
    }
}

extension FakeLaunchScreenPresenter: FakeLaunchScreenPresenterProtocol {
    
    func checkUserAlreadyAuthenticated() {
        // TODO: - Check if user already authenticated
        
        view?.redirectUser(isAuthenticated: false)
    }
}
