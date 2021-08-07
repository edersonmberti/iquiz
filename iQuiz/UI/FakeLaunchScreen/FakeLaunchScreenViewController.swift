//
//  FakeLaunchScreenController.swift
//  iQuiz
//
//  Created by Ederson Machado Berti on 07/08/21.
//

import UIKit

protocol FakeLaunchScreenViewProtocol: AnyObject {
    
    func redirectUser(isAuthenticated: Bool)
}

class FakeLaunchScreenViewController: BaseViewController<FakeLaunchScreenView> {
    
    lazy var presenter: FakeLaunchScreenPresenterProtocol = FakeLaunchScreenPresenter(view: self)
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        presenter.checkUserAlreadyAuthenticated()
    }
}

extension FakeLaunchScreenViewController: FakeLaunchScreenViewProtocol {
    
    func redirectUser(isAuthenticated: Bool) {
        let controller = isAuthenticated ?
            MainTabBarController() :
            UINavigationController(rootViewController: LoginViewController())
        
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: false, completion: nil)
    }
}
