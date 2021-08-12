//
//  ProfileViewController.swift
//  iQuiz
//
//  Created by Ederson Machado Berti on 09/08/21.
//

import UIKit

protocol ProfileViewProtocol: AnyObject {
    
    func redirectToSignIn()
}

class ProfileViewController: BaseViewController<ProfileView> {
    
    lazy var presenter: ProfilePresenterProtocol = ProfilePresenter(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNotificationObservers()
    }
    
    func setupNotificationObservers() {
        customView.signOutButton.addTarget(self, action: #selector(signOutTouched), for: .touchUpInside)
    }
    
    @objc private func signOutTouched() {
        presenter.signOutTouched()
    }
}

extension ProfileViewController: ProfileViewProtocol {
    
    func redirectToSignIn() {
        let loginController = LoginViewController()
        let navigation = UINavigationController(rootViewController: loginController)
        navigation.modalPresentationStyle = .fullScreen
        self.present(navigation, animated: false, completion: nil)
    }
}
